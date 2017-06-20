class Ibeacon < ApplicationRecord
    require 'matrix.rb'
    require 'nmatrix'
    require './lib/algorithm.rb'
    require './lib/rotate.rb'

    def classify_exercise(x,y,z)
        # RubyProf.start
        # p Algorithm.array_string_to_array("531.0,-31.0,-125.0,265.0,-281.0,375.0,250.0,-437.0,359.0,-171.0,-46.0,-156.0,-46.0,")
        
        # curl1
        x1 = Algorithm.ranging([[32.23220254,   68.22593297,   94.7550169 ,  164.85225765,
        131.00469555,  -40.94083798,   71.158512  ,   50.92360813,
        102.22032792,   68.31919456,  -11.37456431,  115.5304386 ,
         70.98808134,   12.18512114,  -11.1429743 ,   86.14423786,
         90.4223545 ,   63.42052565,  -24.26665011,  -25.7093021 ,
         24.07228635,   53.33859898,    4.57185227,  -56.63874399,
         89.91687191,  136.84027333,  153.79952675,   83.50565818,
        102.8362306 ,   36.05128549,  102.09481909,   39.54848344,
         47.55357657,   54.94383639,  199.95105364,  136.80736139,
        136.87758323,   34.33468069,   68.61857582,   60.83347587,
       -211.15928114, -257.12707286,  -99.20177872, -187.6554416 ,
          8.29205926, -256.71525399,  -73.97896402, -119.13412953,
         41.36522055, -133.08031262,    3.08877761, -121.07915253,
         14.47469886, -196.10038604,   54.36542338, -175.71252619,
         19.27249975, -108.16640741,  -16.20382107, -126.45603114,
        -44.5284138 , -276.04909392,  -88.43177848, -267.0910788 ,
        -67.62564212,   65.83242207
]])
        y1 = Algorithm.ranging([[225.15011087,  427.24190858,  371.57195361,  638.29263397,
        367.17851692,  281.66636745,  607.03217221,  708.18090652,
       -309.14271849, -584.18294322,  780.99151985,  325.81958361,
        684.95276708,  190.2932768 ,  672.76392155,  473.03608848,
        318.95073822,   51.90375637,  823.37929829,   55.48339701,
        788.65093166, -238.19469184, -569.67715159,  511.14282781,
       -228.66516376,  -79.30904768, -114.47511796,  369.04246884,
       -167.69965938,  416.17473007, -461.69041832,  828.84032594,
       -562.28243562,  761.7503297 , -575.62475032,  257.13169653,
       -663.14460968,  313.63994018, -672.44372224, -619.88471367,
        280.91858003,  375.4105981 , -319.31510346, -222.08974638,
       -721.07389265,   65.0975559 , -338.8271538 , -380.55283327,
       -592.79990907, -255.15801533, -781.60907881, -448.98570996,
       -436.05251089,  222.58794238, -424.55501417, -183.99951866,
       -313.76863935, -151.0066365 , -147.87519093, -257.16162952,
       -303.18895541,  203.38785871, -402.48898642,  272.09296083,
       -507.77595758, -635.05603816
]])
        z1 = Algorithm.ranging([[-105.61379292,   27.30857792,   -6.26319326,   45.96185352,
        -15.13215666, -340.2296894 ,   52.38568069,  449.51221243,
        129.63678584,  133.18473423,  283.74565278, -217.77466456,
        402.31188983, -179.07885703,  156.32221171,  -91.72010533,
       -240.99971731, -332.05360646,  593.86509809, -318.82258318,
        890.9514286 , -211.28835857,  104.03240398,  139.50683192,
       -169.56045372, -203.75029122, -349.50944607,  -25.73249307,
       -287.67183101,   35.00985184,  -69.07200492,  851.31180308,
        -63.11390783,  684.30606811, -110.8107801 ,  214.41310334,
        -88.47221371,  343.52998105,  234.05566789,  142.14841661,
        105.02206233,  -86.14598062, -241.63489036, -151.38424237,
       -110.19688174,  147.05703447,  -60.5490281 , -157.23914497,
       -132.823219  , -126.8476394 ,   42.8469587 , -134.8972947 ,
       -150.79967608,   52.94743905, -123.56848685, -175.56070456,
       -245.88719297,  -91.49530403, -182.84122218, -336.68830377,
       -210.39756465,  -65.19045028, -185.27788291,  -53.81666864,
         47.30706587,  141.23111065
]])

        # press1
        x2 = Algorithm.ranging([[-19.6704802 ,  -39.97860506, -517.19424209,  104.56283907,
       -457.69476326,   12.8235076 ,  161.95680787,  131.80392297,
        -10.02966109,  143.2981064 , -104.1275942 ,   63.08038135,
        337.15069243,   60.61676264,  -53.40958124,   -3.91740405,
        -83.52779189,  127.65797767,   29.57226712,    0.59844434,
       -177.20809453, -338.06818076,   10.00982952,   10.85144144,
        277.16619086, -228.78598715, -252.43189172, -152.49136263,
        238.54007964,  219.97299441,    1.05225918,   -8.21833468,
        230.1879228 ,  142.65460746,   75.80912256,  105.28367277,
         91.83048522,  176.23963705,   75.33025877, -122.34609974,
       -118.73809316, -118.10605472,  -30.12710352, -223.73869009,
         80.22366271,  109.30238963, -154.72809383,  -58.85330712,
        190.39058953,  173.34511672,  -58.42687553,   36.55025443,
         14.26312908,   47.96719151,  218.98718776, -127.52338973,
          0.60843399,  -63.25853635, -201.73838458,   24.65043639
]])
        y2 = Algorithm.ranging([[-398.43363545,  -168.75458789,  -493.39839694,  -246.76201002,
           1.7112084 ,  1317.45512201,   633.16482146,  -676.48194126,
        -289.14013876,  -580.05075891,  -786.73830849,  -127.0652901 ,
        -662.74384865,  -505.22820437,  -366.41696294,  -766.61421861,
        -217.64504568,   917.74457017,  1259.48397705,  1266.03246684,
        1680.21795934,  -377.33117109,  -699.25884468,  -257.87790793,
         109.20219329,  -276.34880335,  -424.80380785,  -472.20622551,
          35.42274204,    88.48423496,  -158.02952105,  -680.27562013,
          39.27686441,    -9.46867119,  -110.51457056,  -672.38075055,
         -38.15673667,    89.68615486,  -126.98451061,  -524.46410185,
        -288.52461505,  1508.0897757 ,  1318.82067999,   253.66434221,
         187.15982944,   248.93151446,  -375.00274257,  -460.48916062,
          61.58448558,   -44.48491794,  -279.47031301,  -416.63276737,
         -90.06609566,  -104.31080177,    71.94346474,  -188.53456784,
        -192.2714275 ,  -254.77381983,  1498.22190776,  1221.83750557
]])
        z2 = Algorithm.ranging([[106.26889671,  163.24358566, -171.38700622,  149.11513835,
        161.34004515,  723.58155071,  174.87758378, -220.50724198,
       -145.01179532, -242.09220939, -564.35728588,  323.57401873,
       -422.12561684,  -98.66494306,  160.96447006, -377.30932733,
        191.63709661,   16.90303877,  460.21711612,  576.38352639,
        366.31398425, -652.25835413, -597.86835745, -234.44139042,
        222.40612629, -437.34217614, -403.3130293 , -577.33860628,
        231.27269865,  234.3938067 ,  -25.87659074, -895.10962514,
        198.08554425,  265.13620768,  169.82405018, -820.94113223,
         50.65333308,  353.65381191,  139.07487516, -684.16265547,
       -176.42990997,  428.38521176,  603.77595712,  259.66183413,
        141.60236665,  387.09510905, -176.93321179, -353.42428125,
        289.84905717,  268.29137887,  -38.54018358, -546.53507125,
         71.86002331,   47.71205188,  283.85521697, -128.28628086,
        -87.17336768, -179.24106588,  498.48698481,  537.17501868
]])

        # row1
        x3 = Algorithm.ranging([[235.07573784,  355.94861805,  300.3275258 ,  289.77488366,
         53.42456886,  250.5969502 , -170.44273213, -346.11150965,
        112.83043608,  259.54417753,  155.61651977,  188.2325986 ,
         -3.00373651,  117.75044725,  -25.67797479,  186.13360385,
         81.27219393,  -49.81428428, -235.80443237, -209.1953528 ,
        169.33526967,  188.24762963,  158.9717539 ,  184.12366197,
        144.71964918,  111.83783708,   71.5776156 ,  131.90060823,
        -34.66060039, -117.06019049,  -30.80770224,  -54.68863243,
       -229.5736454 , -123.56138779,   53.53649535, -313.57255201,
        -22.13341465,   77.49411022, -180.55583816,  -75.47546249,
          3.62774032,   77.53546283,  111.65058095,    1.78665429,
       -192.09640225, -270.92666532,  103.42820514,   77.47051769,
         38.02404413, -265.19929707, -192.39566357,   35.51840519,
       -110.37683258,   15.43339655,  116.86525414, -136.38574194,
         12.92256537,   85.15862012, -169.4128646 ,   33.94253724,
         17.29283563, -106.54041723, -119.9272596 ,   77.07118287,
       -128.13438171, -188.4641443 , -299.40239042, -284.59938555
]])
        y3 = Algorithm.ranging([[-223.94540449,  188.76746489,   89.1151614 , -182.0568256 ,
        405.05728461,  -86.80008703, -106.98789444, -135.0017139 ,
        119.1687426 ,  126.61568421,  -43.2670719 ,   73.18974155,
       -164.9008668 , -118.77131555,  144.15900965,  -54.00608474,
       -247.06916883,  161.13954538,  -34.16369283, -177.04533539,
        179.06898223,  141.80874234, -233.51303809,  117.04054177,
        123.26599426, -153.89479305,  137.65346033,  -63.81400126,
       -132.46728889,  183.01248493, -194.37558789,  -23.08867847,
        232.53066963, -306.60725203,  -41.79009988,  488.18966736,
        -95.5524557 ,  139.73046032,  343.17833928, -191.22377089,
        -66.57437085,  289.75518375,   15.43137975, -147.79655888,
       -138.83578274, -148.89254374,  -24.66221271,   41.93653641,
        -57.81596005,   -5.40551043, -334.83414443, -103.45811596,
        372.1875122 , -216.04657373,  -38.03825492,  211.68885509,
       -276.54001182, -273.68308001,  257.20230798,   23.39378833,
        -79.27024221,  282.64120918, -295.44638304,  285.59066084,
        456.37218781, -155.59105323,  -96.6758979 , -158.98247381
]])
        z3 = Algorithm.ranging([[-247.64894622,   161.30683901,   152.7212403 ,   -25.61662784,
         647.11329589,  -298.91544468,   -50.423919  ,   -43.37363381,
         127.54935903,    93.59908461,    82.97406084,    27.37728034,
        -278.01185887,  -314.74728601,   404.48420095,  -144.52622747,
        -284.56454461,   509.11736955,   145.18150987,   -64.06904116,
          93.5322299 ,   176.01251339,  -361.27836149,   -20.76027216,
          71.05784979,  -299.37255449,   -82.51377437,  -281.51377055,
        -158.65983337,   232.21203805,  -261.27327152,  -114.14918841,
         682.56153771,  -496.29413737,  -141.39948298,  1050.63172201,
        -274.71742557,  -183.85320974,   727.32031088,  -474.37619793,
        -123.48702686,    48.90757014,    83.67262841,   -38.06708438,
        -112.84050798,   -57.77099571,  -115.41000865,   -11.62270173,
        -369.47520651,   117.36229217,  -602.92473815,  -220.65479333,
         665.32535091,  -367.08030889,  -231.46830094,   598.78425311,
        -390.72855777,  -323.12093738,   653.69995919,  -116.57736533,
        -237.9688159 ,   454.75293693,  -472.45660151,    70.43525448,
         839.62856329,  -195.57543177,    42.43656377,   -70.4694221
]])

        xx = Algorithm.ranging([Algorithm.array_string_to_array(x)])
        yy = Algorithm.ranging([Algorithm.array_string_to_array(y)])
        zz = Algorithm.ranging([Algorithm.array_string_to_array(z)])

        choices = ["Curl","Shoulder Press","Row"]

        pol = 4
        pol2 = 4

        
       
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
        theta = Rotate.angle_guess_3d(big_4)
        datr3 = Rotate.rotate_3d(big_4, theta).transpose
        datr3[0] = datr3[0].collect{ |ele| ele - (datr3[0]).mean}
        # datr3[0] = datr3[0].collect{ |ele| ele / (datr3[0]).standard_deviation}
        datr3[1] = datr3[1].collect{ |ele| ele - (datr3[1]).mean}
        # datr3[1] = datr3[1].collect{ |ele| ele / (datr3[1]).standard_deviation}
        datr3[2] = datr3[2].collect{ |ele| ele - (datr3[2]).mean}
        # datr3[2] = datr3[2].collect{ |ele| ele / (datr3[2]).standard_deviation}
        datr3 = datr3.transpose
        theta = Rotate.angle_guess_2d(datr3)
        datr2 = Rotate.rotate_2d(datr3, theta).transpose
        if Rotate.slope(N[*datr2[1]],N[*datr3.transpose[2]]) < 0.0
          datr2[0] = datr2[0].collect{ |ele| ele *-1.0}
          datr2[1] = datr2[1].collect{ |ele| ele *-1.0}
        end
        big_4 = [datr2[0],datr2[1],datr3.transpose[2]].transpose

        func1 = Algorithm.polyfunc(big_1.transpose[1],big_1.transpose[2],pol)
        func2 = Algorithm.polyfunc(big_2.transpose[1],big_2.transpose[2],pol)
        func3 = Algorithm.polyfunc(big_3.transpose[1],big_3.transpose[2],pol)
        func4 = Algorithm.polyfunc(big_4.transpose[1],big_4.transpose[2],pol)
        func5 = Algorithm.polyfunc(big_1.transpose[1],big_1.transpose[0],pol)
        func6 = Algorithm.polyfunc(big_2.transpose[1],big_2.transpose[0],pol)
        func7 = Algorithm.polyfunc(big_3.transpose[1],big_3.transpose[0],pol)
        func8 = Algorithm.polyfunc(big_4.transpose[1],big_4.transpose[0],pol)

        # p func1.substitute(5)
        # big_1 = big_1.transpose
        # big_1[0] = big_1[1].collect{ |e| func5.substitute(e)}
        # big_1[2] = big_1[1].collect{ |e| func1.substitute(e)}
        # big_1 = big_1.transpose

        # big_2 = big_2.transpose
        # big_2[0] = big_2[1].collect{ |e| func6.substitute(e)}
        # big_2[2] = big_2[1].collect{ |e| func2.substitute(e)}
        # big_2 = big_2.transpose

        # big_3 = big_3.transpose
        # big_3[0] = big_3[1].collect{ |e| func7.substitute(e)}
        # big_3[2] = big_3[1].collect{ |e| func3.substitute(e)}
        # big_3 = big_3.transpose

         
        # big_4 = big_4.transpose
        # big_4[0] = big_4[1].collect{ |e| func8.substitute(e)}
        # big_4[2] = big_4[1].collect{ |e| func4.substitute(e)}
        # big_4 = big_4.transpose
        
        data = big_4.transpose[1..2].transpose + big_1.transpose[1..2].transpose + big_2.transpose[1..2].transpose + big_3.transpose[1..2].transpose
        # data = big_4 + big_1 + big_2 + big_3

        data = Algorithm.feature_matrix(data.transpose).transpose
        logistic_guess = Algorithm.nonlinear_logistic_regression_tester(choices ,data,pol,pol2, [xx[0].length, x1[0].length, x2[0].length, x3[0].length])
        p "Exercise is a: " + choices[logistic_guess].to_s
        return choices[logistic_guess].to_s
        # result = RubyProf.stop
        # printer = RubyProf::CallStackPrinter.new(result)
        # File.open("tmp/profile_data2.html", 'w') { |file| printer.print(file) }
    end
end
