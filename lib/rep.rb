require 'matrix.rb'
require 'nmatrix'
require './lib/algorithm.rb'
class Rep

    def self.compute_cost_multi_var(x,y,theta)# input as a array
        m = x.length
        matrix_x = N[*x]
        matrix_y = N[*y]
        matrix_t = N[*theta]
        predictions = (matrix_x.dot(matrix_t))
        j = (predictions - matrix_y).collect{|e| e ** 2}.to_a
        return j.sum / (1.0*m)
    end
    def self.compute_cost_multi_df(matrix_t,matrix_x,matrix_y) # input as a array
        predictions = N[(matrix_x.dot(matrix_t)).collect{ |e| e }].transpose
        return matrix_x.transpose.dot(matrix_y - predictions)
    end

    def self.power_element(x,p)
        return x.collect{|e| e ** p}
    end

    def self.regularize(x)
        matrix_x = N[*x]
        final = []
        (0..(matrix_x.cols - 1)).each do |col_i|
            curr_arr = matrix_x.column(col_i).transpose.to_a 
            p "*************************"
            p curr_arr
            final += [(curr_arr).collect{ |num| (num - curr_arr.mean) / ((curr_arr.max - curr_arr.mean)/ 1.633) }]
        end
        return final.transpose
    end

    def self.meshing(x,pol)
        main_final = []
        base_possible = (0..(x[0].length - 1)).to_a
        possible = []
        (2..pol).each do |pow|
            possible.push(*base_possible.repeated_combination(pow).to_a)
        end
        (0..(x.length - 1)).each do |i|
            curr_x = x[i]
            current = [1.0] + curr_x
            possible.each do |block|
                curr_num = 1.0
                block.each do |multi_index|
                    curr_num *= curr_x[multi_index].to_f
                end
                current.push(curr_num)
            end
            main_final.push(current)
        end
        return main_final
    end

    def self.hessian(x) # input as a matrix
        return x.transpose.dot(x)
    end
    def self.magnitute(x,y,z)
        return Math.sqrt((x**2) + (y**2) + (z**2))
    end
    def self.mags(x,y,z)
        mags = []
        x.each_with_index do |item, i|
            mags = mags + [Rep.magnitute(x[i],y[i],z[i])]
        end
        return mags
    end
    def self.nonlinear_regression(x,y,xx, pol2)
        # TODO: fix!
        x = Rep.meshing(x,pol2)
        matrix_x = N[*x]
        matrix_y = N[*y]
        matrix_theta = N.zeros([matrix_x.cols,1])
        # matrix_theta = N[*[[-5.309575207882087], [0.0002531245579895821], [0.005180486264794318], [0.8012800842301145], [5.927152829519896e-09], [3.323754848002685e-07], [-2.160859974858134e-05], [-3.7795459125656428e-06], [-0.00016899041498311462], [-0.004027244478202384]]]
        i = 0
        i_max = 601
        r = -Rep.compute_cost_multi_df(matrix_theta,matrix_x,matrix_y)
        # p "r"
        d = r
        # p r
        alphastore = []
        hess = Rep.hessian(matrix_x)
        while (i < i_max)
                if i % 200 == 0
                    curr = Rep.compute_cost_multi_var(matrix_x.to_a,matrix_y.to_a,matrix_theta.to_a)
                    z = (Matrix[*Algorithm.meshing(xx,pol2)] * Matrix[*matrix_theta.to_a] ).to_a.transpose[0]
                    p "cost at iter" + i.to_s + " is :" + curr.to_s + " ====== " + z.to_s
                    # TODO: check logistic_df, and make sure poly functions are actually doing their jobs!
                end
            alpha = ((-r.transpose.dot(d)) /  (( d.transpose.dot(hess)).dot(d)))[0,0]
            alphastore = alphastore+[alpha]
            # p "alpha: "
            # p alpha
            matrix_theta = matrix_theta + ( NMatrix.new( [d.rows, d.cols], alpha)*d )
            dr = r
            r = -Rep.compute_cost_multi_df(matrix_theta,matrix_x,matrix_y)
            beta = (r.transpose.dot(r)) / (dr.transpose.dot(dr))
            beta = beta[0,0]
            # p "beta: "
            # p beta
            d = r + ( NMatrix.new( [d.rows, d.cols], beta)*d )
            i += 1
        end
        # p matrix_theta.to_a.transpose[0]
        # p matrix_theta.to_a.transpose[0].mean
        p "coffs:"
        p matrix_theta.to_a
        z = (Matrix[*Algorithm.meshing(xx,pol2)] * Matrix[*matrix_theta.to_a] ).to_a.transpose[0]
        return z
    end
    def self.rep_predict(arr_x,arr_y,arr_z)

        x1 = Algorithm.array_string_to_array("1000.0,906.0,937.0,937.0,953.0,1218.0,906.0,531.0,718.0,671.0,")
        y1 = Algorithm.array_string_to_array("62.0,250.0,187.0,421.0,171.0,125.0,421.0,546.0,-453.0,-703.0,")
        z1 = Algorithm.array_string_to_array("-140.0,-15.0,-15.0,140.0,15.0,-250.0,46.0,156.0,-171.0,-281.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus = [[mag1.sum, mag1.standard_deviation]]
        plus1 = [mag1.length]
        y = [[4.0]]

        x1 = Algorithm.array_string_to_array("687.0,1140.0,578.0,1062.0,796.0,1031.0,1156.0,1203.0,390.0,1171.0,109.0,1046.0,687.0,")
        y1 = Algorithm.array_string_to_array("625.0,125.0,515.0,31.0,515.0,281.0,125.0,-125.0,687.0,-93.0,656.0,-390.0,-671.0,")
        z1 = Algorithm.array_string_to_array("78.0,-62.0,156.0,-187.0,15.0,-15.0,-93.0,-218.0,156.0,-296.0,265.0,-281.0,-343.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[6.0]]

        x1 = Algorithm.array_string_to_array("781.0,1015.0,1078.0,1218.0,953.0,1140.0,890.0,890.0,156.0,859.0,312.0,937.0,718.0,890.0,578.0,562.0,656.0,")
        y1 = Algorithm.array_string_to_array("375.0,-390.0,-265.0,-312.0,187.0,-343.0,250.0,-609.0,687.0,-687.0,609.0,-750.0,78.0,-812.0,171.0,-781.0,-734.0,")
        z1 = Algorithm.array_string_to_array("-78.0,-234.0,-156.0,-187.0,-31.0,-234.0,-46.0,-265.0,281.0,-343.0,234.0,-218.0,46.0,-296.0,0.0,-281.0,-296.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[8.0]]

        x1 = Algorithm.array_string_to_array("687.0,859.0,968.0,828.0,812.0,734.0,468.0,781.0,671.0,828.0,656.0,890.0,515.0,843.0,312.0,937.0,453.0,734.0,640.0,453.0,656.0,")
        y1 = Algorithm.array_string_to_array("437.0,-593.0,-328.0,-734.0,-93.0,-812.0,437.0,-953.0,312.0,-937.0,296.0,-828.0,421.0,-921.0,656.0,-781.0,484.0,-937.0,140.0,-796.0,-718.0,")
        z1 = Algorithm.array_string_to_array("-15.0,-250.0,-203.0,-359.0,-109.0,-187.0,171.0,-187.0,31.0,-218.0,-31.0,-203.0,78.0,-218.0,156.0,-218.0,125.0,-218.0,93.0,-140.0,-281.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[10.0]]

        x1 = Algorithm.array_string_to_array("750.0,937.0,1031.0,937.0,875.0,671.0,859.0,937.0,921.0,921.0,718.0,906.0,953.0,796.0,937.0,968.0,1062.0,906.0,1015.0,1125.0,1015.0,890.0,968.0,890.0,734.0,656.0,")
        y1 = Algorithm.array_string_to_array("203.0,296.0,-421.0,-296.0,-828.0,15.0,-437.0,-468.0,-718.0,-343.0,-875.0,-531.0,-562.0,140.0,-562.0,-265.0,-453.0,-250.0,-281.0,-359.0,-421.0,140.0,-500.0,203.0,-593.0,-750.0,")
        z1 = Algorithm.array_string_to_array("-296.0,-359.0,-453.0,-484.0,-437.0,-390.0,-390.0,-468.0,-375.0,-437.0,-421.0,-484.0,-359.0,-312.0,-312.0,-468.0,-343.0,-375.0,-312.0,-484.0,-390.0,-421.0,-453.0,-390.0,-406.0,-296.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[12.0]]

        x1 = Algorithm.array_string_to_array("921.0,1109.0,1000.0,968.0,140.0,906.0,406.0,1046.0,734.0,437.0,609.0,703.0,781.0,890.0,890.0,828.0,281.0,578.0,562.0,1000.0,1046.0,859.0,953.0,890.0,765.0,234.0,531.0,453.0,718.0,")
        y1 = Algorithm.array_string_to_array("-500.0,-343.0,-531.0,-203.0,734.0,-1031.0,328.0,-484.0,234.0,421.0,-1109.0,-93.0,-1015.0,-828.0,-421.0,-968.0,625.0,-1078.0,421.0,-718.0,-656.0,-1046.0,-671.0,-1000.0,-1015.0,468.0,-921.0,-921.0,-640.0,")
        z1 = Algorithm.array_string_to_array("-203.0,-125.0,-109.0,0.0,265.0,-281.0,218.0,-187.0,46.0,78.0,-250.0,0.0,-265.0,-343.0,-203.0,-312.0,234.0,-234.0,46.0,-203.0,-265.0,-234.0,-281.0,-281.0,-265.0,234.0,-203.0,-281.0,-296.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[15.0]]

        x1 = Algorithm.array_string_to_array("593.0,734.0,703.0,812.0,812.0,812.0,921.0,875.0,921.0,953.0,515.0,671.0,")
        y1 = Algorithm.array_string_to_array("500.0,-859.0,390.0,-750.0,-187.0,-750.0,-93.0,-640.0,-187.0,-453.0,-890.0,-703.0,")
        z1 = Algorithm.array_string_to_array("156.0,-265.0,140.0,-234.0,-46.0,-218.0,15.0,-265.0,-46.0,-203.0,-312.0,-296.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[5.0]]

        x1 = Algorithm.array_string_to_array("921.0,703.0,859.0,562.0,687.0,875.0,1015.0,609.0,")
        y1 = Algorithm.array_string_to_array("-406.0,406.0,-750.0,515.0,-968.0,-62.0,-546.0,-781.0,")
        z1 = Algorithm.array_string_to_array("-250.0,125.0,-296.0,203.0,-187.0,-46.0,-359.0,-296.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[ 3.0]]

        x1 = Algorithm.array_string_to_array("546.0,593.0,234.0,640.0,625.0,593.0,781.0,593.0,796.0,750.0,531.0,796.0,484.0,703.0,375.0,859.0,687.0,468.0,687.0,")
        y1 = Algorithm.array_string_to_array("421.0,-921.0,796.0,-1062.0,-15.0,-828.0,-875.0,-890.0,-218.0,-281.0,-968.0,-640.0,-1046.0,109.0,-1031.0,-437.0,-890.0,-828.0,-687.0,")
        z1 = Algorithm.array_string_to_array("-203.0,-406.0,-203.0,-437.0,-328.0,-390.0,-421.0,-343.0,-437.0,-359.0,-437.0,-359.0,-375.0,-328.0,-312.0,-328.0,-390.0,-203.0,-234.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[9.0]]

        x1 = Algorithm.array_string_to_array("890.0,765.0,562.0,359.0,484.0,468.0,359.0,687.0,531.0,593.0,296.0,734.0,625.0,437.0,718.0,328.0,375.0,296.0,312.0,515.0,")
        y1 = Algorithm.array_string_to_array("-859.0,-890.0,-437.0,-1328.0,500.0,-1265.0,796.0,-156.0,-1046.0,-1171.0,-1359.0,-1000.0,-1031.0,-1062.0,-640.0,-203.0,-1484.0,93.0,-984.0,-812.0,")
        z1 = Algorithm.array_string_to_array("-390.0,-46.0,-15.0,-187.0,171.0,-203.0,187.0,-78.0,-234.0,-250.0,-250.0,-218.0,-218.0,-203.0,-140.0,-93.0,-265.0,93.0,-234.0,-281.0,")
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]
        plus1 += [mag1.length]
        y += [[11.0]]




        # old_plus = plus.collect{|ele| ele}
        # plus = plus.collect{|ele| ele }
        # plus = (plus.transpose << plus1).transpose
        # x1 = Algorithm.array_string_to_array(arr_x)
        # y1 = Algorithm.array_string_to_array(arr_y)
        # z1 = Algorithm.array_string_to_array(arr_z)
        # mag1 = Rep.mags(x1,y1,z1)
        # xx = [[mag1.sum, mag1.standard_deviation, mag1.length]]


        x1 = Algorithm.array_string_to_array(arr_x)
        y1 = Algorithm.array_string_to_array(arr_y)
        z1 = Algorithm.array_string_to_array(arr_z)
        mag1 = Rep.mags(x1,y1,z1)
        plus += [[mag1.sum, mag1.standard_deviation]]


        # plus = Rep.regularize(plus)


        xx = plus.pop
        plus = (plus.transpose << plus1).transpose
        xx += [mag1.length]
        xx = [xx]


        p "======"
        p "wierd datr"
        p "======"
        p plus
        p "======"
        p "time"
        p "======"
        p plus1
        # p Rep.regularize([plus1].transpose).transpose[0]
        p "======"
        p "reps"
        p "======"
        p y.transpose
        p "======"
        p xx
        p "======"
        # TODO: Need more data, get 20 points
        ans = Rep.nonlinear_regression(plus,y,xx, 2)[0]
        p "prediction: " + ans.to_s
        return (ans).round
    end      

end