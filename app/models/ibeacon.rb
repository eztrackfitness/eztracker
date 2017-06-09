class Ibeacon < ApplicationRecord
    require 'matrix.rb'
    require 'nmatrix'
    require './lib/algorithm.rb'


    def classify_exercise(x,y,z)
        # RubyProf.start
        # p Algorithm.array_string_to_array("531.0,-31.0,-125.0,265.0,-281.0,375.0,250.0,-437.0,359.0,-171.0,-46.0,-156.0,-46.0,")
        
        # curl1
        x1 = Algorithm.ranging([[1000.0,906.0,937.0,937.0,953.0,1218.0,906.0,531.0,718.0,671.0,687.0,1140.0,578.0,1062.0,796.0,1031.0,1156.0,1203.0,390.0,1171.0,109.0,1046.0,687.0,781.0,1015.0,1078.0,1218.0,953.0,1140.0,890.0,890.0,156.0,859.0,312.0,937.0,718.0,890.0,578.0,562.0,656.0,750.0,937.0,1031.0,937.0,875.0,671.0,859.0,937.0,921.0,921.0,718.0,906.0,953.0,796.0,937.0,968.0,1062.0,906.0,1015.0,1125.0,1015.0,890.0,968.0,890.0,734.0,656.0]])
        y1 = Algorithm.ranging([[62.0,250.0,187.0,421.0,171.0,125.0,421.0,546.0,-453.0,-703.0,625.0,125.0,515.0,31.0,515.0,281.0,125.0,-125.0,687.0,-93.0,656.0,-390.0,-671.0,375.0,-390.0,-265.0,-312.0,187.0,-343.0,250.0,-609.0,687.0,-687.0,609.0,-750.0,78.0,-812.0,171.0,-781.0,-734.0,203.0,296.0,-421.0,-296.0,-828.0,15.0,-437.0,-468.0,-718.0,-343.0,-875.0,-531.0,-562.0,140.0,-562.0,-265.0,-453.0,-250.0,-281.0,-359.0,-421.0,140.0,-500.0,203.0,-593.0,-750.0]])
        z1 = Algorithm.ranging([[-140.0,-15.0,-15.0,140.0,15.0,-250.0,46.0,156.0,-171.0,-281.0,78.0,-62.0,156.0,-187.0,15.0,-15.0,-93.0,-218.0,156.0,-296.0,265.0,-281.0,-343.0,-78.0,-234.0,-156.0,-187.0,-31.0,-234.0,-46.0,-265.0,281.0,-343.0,234.0,-218.0,46.0,-296.0,0.0,-281.0,-296.0,-296.0,-359.0,-453.0,-484.0,-437.0,-390.0,-390.0,-468.0,-375.0,-437.0,-421.0,-484.0,-359.0,-312.0,-312.0,-468.0,-343.0,-375.0,-312.0,-484.0,-390.0,-421.0,-453.0,-390.0,-406.0,-296.0]])

        # press1
        x2 = Algorithm.ranging([[171.0,250.0,515.0,171.0,484.0,546.0,578.0,234.0,421.0,296.0,531.0,109.0,328.0,250.0,156.0,359.0,218.0,859.0,718.0,640.0,1078.0,890.0,562.0,500.0,234.0,734.0,640.0,718.0,203.0,234.0,390.0,812.0,234.0,187.0,234.0,718.0,359.0,156.0,250.0,765.0,484.0,921.0,656.0]])
        y2 = Algorithm.ranging([[875.0,656.0,1031.0,750.0,453.0,-843.0,46.0,1312.0,937.0,1250.0,1562.0,546.0,1453.0,1093.0,812.0,1453.0,671.0,-93.0,-640.0,-718.0,-953.0,1250.0,1531.0,968.0,453.0,1062.0,1156.0,1312.0,500.0,453.0,765.0,1687.0,515.0,500.0,625.0,1656.0,640.0,375.0,656.0,1421.0,937.0,-843.0,-781.0]])
        z2 = Algorithm.ranging([[203.0,156.0,640.0,46.0,484.0,-281.0,-296.0,93.0,109.0,46.0,281.0,78.0,-140.0,125.0,234.0,218.0,218.0,-390.0,-328.0,-281.0,-296.0,343.0,140.0,62.0,-218.0,250.0,328.0,218.0,-156.0,-156.0,78.0,93.0,-156.0,-46.0,31.0,0.0,-31.0,-93.0,31.0,187.0,203.0,-281.0,-265.0]])

        # row1
        x3 = Algorithm.ranging([[406.0,171.0,187.0,234.0,125.0,468.0,593.0,703.0,343.0,265.0,296.0,343.0,609.0,562.0,265.0,421.0,531.0,218.0,531.0,609.0,343.0,265.0,531.0,390.0,359.0,546.0,515.0,546.0,562.0,453.0,609.0,578.0,250.0,796.0,515.0,140.0,640.0,578.0,218.0,781.0,531.0,468.0,343.0,453.0,640.0,656.0]])
        y3 = Algorithm.ranging([[-1203.0,-984.0,-953.0,-1078.0,-421.0,-1250.0,-781.0,-656.0,-843.0,-968.0,-906.0,-968.0,-1062.0,-1171.0,-546.0,-1093.0,-1125.0,-453.0,-593.0,-765.0,-906.0,-859.0,-1234.0,-1000.0,-906.0,-1156.0,-968.0,-1156.0,-953.0,-609.0,-1031.0,-906.0,-203.0,-1140.0,-1000.0,125.0,-1046.0,-1046.0,-203.0,-1156.0,-953.0,-875.0,-875.0,-890.0,-812.0,-718.0]])
        z3 = Algorithm.ranging([[-281.0,218.0,109.0,-187.0,453.0,-156.0,-218.0,-281.0,93.0,125.0,-62.0,46.0,-281.0,-218.0,140.0,-109.0,-343.0,171.0,-125.0,-296.0,156.0,140.0,-328.0,78.0,93.0,-250.0,62.0,-156.0,-234.0,125.0,-312.0,-125.0,234.0,-484.0,-125.0,531.0,-218.0,46.0,359.0,-359.0,-156.0,234.0,-15.0,-218.0,-265.0,-281.0]])

        xx = Algorithm.ranging([Algorithm.array_string_to_array(x)])
        yy = Algorithm.ranging([Algorithm.array_string_to_array(y)])
        zz = Algorithm.ranging([Algorithm.array_string_to_array(z)])

        choices = ["Curl","Shoulder Press","Row"]

        pol = 4
        pol2 = 4

        beginning_time = Time.now
        p "========================"
        big_1 = x1.transpose
        big_1 = (big_1.transpose << y1[0]).transpose
        big_1 = (big_1.transpose << z1[0]).transpose

        big_2 = x2.transpose
        big_2 = (big_2.transpose << y2[0]).transpose
        big_2 = (big_2.transpose << z2[0]).transpose

        big_3 = x3.transpose
        big_3 = (big_3.transpose << y3[0]).transpose
        big_3 = (big_3.transpose << z3[0]).transpose

        big_4 = xx.transpose
        big_4 = (big_4.transpose << yy[0]).transpose
        big_4 = (big_4.transpose << zz[0]).transpose
        data = big_4 + big_1 + big_2 + big_3

        data = Algorithm.feature_matrix(data.transpose).transpose
        logistic_guess = Algorithm.nonlinear_logistic_regression_tester(choices ,data,pol,pol2, [xx[0].length, x1[0].length, x2[0].length, x3[0].length])
        p "Exercise is a: " + choices[logistic_guess].to_s
        end_time = Time.now
        p "this took: " + (end_time - beginning_time).to_s + "  seconds!"
        p "========================"
        return choices[logistic_guess].to_s
        # result = RubyProf.stop
        # printer = RubyProf::CallStackPrinter.new(result)
        # File.open("tmp/profile_data2.html", 'w') { |file| printer.print(file) }
    end
end
