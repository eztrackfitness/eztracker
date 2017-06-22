class IbeaconsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	require './lib/algorithm.rb'
	require './lib/rep.rb'
    require './lib/rotate.rb'
	def index 
   #      beginning_time = Time.now
   #       p "========================"
	  #   @info = Ibeacon.new 
   #      tally = 0
   #      correct = 0
   #      choices = ["Curl","Shoulder Press","Row"]
   #      error = []
   #      # Bad press1
   #      @info.x_motion = "828.0,1375.0,625.0,859.0,1234.0,625.0,1062.0,968.0,500.0,1343.0,625.0,1109.0,984.0,796.0,1062.0,984.0,562.0,"
   #      @info.y_motion = "-1000.0,203.0,281.0,171.0,734.0,562.0,421.0,421.0,171.0,921.0,390.0,359.0,484.0,140.0,500.0,-562.0,-781.0,"
   #      @info.z_motion = "-234.0,187.0,109.0,78.0,46.0,-62.0,93.0,-62.0,-140.0,78.0,-15.0,265.0,0.0,-125.0,-31.0,-218.0,-296.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"


   #      # #  Row 15
   #      @info.x_motion = "1984.0,765.0,1843.0,1046.0,125.0,1281.0,-265.0,1984.0,1984.0,1984.0,1375.0,859.0,62.0,0.0,"
   #      @info.y_motion = "1984.0,-78.0,734.0,-796.0,218.0,-296.0,93.0,171.0,78.0,437.0,281.0,-515.0,-156.0,-15.0,"
   #      @info.z_motion = "1984.0,1687.0,1984.0,-1187.0,687.0,1078.0,437.0,1984.0,1984.0,937.0,906.0,1343.0,921.0,1031.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 15).abs / 15.0]
   #      p"15"

   #      # Curl 5 
   #      @info.x_motion = "703.0,1140.0,1171.0,593.0,781.0,1125.0,546.0,1031.0,921.0,1250.0,718.0,671.0,"
   #      @info.y_motion = "515.0,-93.0,-93.0,453.0,343.0,-125.0,421.0,-31.0,328.0,93.0,-593.0,-718.0,"
   #      @info.z_motion = "125.0,-171.0,-46.0,125.0,15.0,-156.0,109.0,-62.0,62.0,-218.0,-203.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 5).abs / 5.0]
   #      p"5"
   #      # Curl 9 
   #      @info.x_motion = "234.0,1203.0,984.0,1078.0,1062.0,-93.0,1203.0,1062.0,640.0,1000.0,1000.0,625.0,1218.0,437.0,703.0,671.0,671.0,"
   #      @info.y_motion = "625.0,-562.0,-31.0,-15.0,-625.0,703.0,-296.0,0.0,-46.0,-890.0,156.0,187.0,-500.0,250.0,-562.0,-625.0,-734.0,"
   #      @info.z_motion = "171.0,-218.0,-125.0,-125.0,-250.0,328.0,-125.0,-78.0,78.0,-218.0,15.0,-31.0,-296.0,31.0,-234.0,-265.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 9).abs / 9.0]
   #      p"9"
   #      # Press 3
   #      @info.x_motion = "640.0,296.0,937.0,546.0,375.0,421.0,593.0,671.0,"
   #      @info.y_motion = "-515.0,546.0,1437.0,812.0,734.0,546.0,-656.0,-734.0,"
   #      @info.z_motion = "-78.0,-46.0,234.0,-15.0,62.0,187.0,-218.0,-328.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 3).abs / 3.0]
   #      p"3"
   #      # Curl 11
   #      @info.x_motion = "890.0,765.0,562.0,359.0,484.0,468.0,359.0,687.0,531.0,593.0,296.0,734.0,625.0,437.0,718.0,328.0,375.0,296.0,312.0,515.0,"
   #      @info.y_motion = "-859.0,-890.0,-437.0,-1328.0,500.0,-1265.0,796.0,-156.0,-1046.0,-1171.0,-1359.0,-1000.0,-1031.0,-1062.0,-640.0,-203.0,-1484.0,93.0,-984.0,-812.0,"
   #      @info.z_motion = "-390.0,-46.0,-15.0,-187.0,171.0,-203.0,187.0,-78.0,-234.0,-250.0,-250.0,-218.0,-218.0,-203.0,-140.0,-93.0,-265.0,93.0,-234.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 11).abs / 11.0]
   #      p"11"  
   #       # Row 5
   #      @info.x_motion = "375.0,218.0,171.0,203.0,296.0,453.0,203.0,375.0,390.0,531.0,593.0,656.0,"
   #      @info.y_motion = "-734.0,93.0,-1015.0,-1046.0,-968.0,-1062.0,-906.0,-1125.0,-1312.0,-656.0,-859.0,-734.0,"
   #      @info.z_motion = "281.0,359.0,-78.0,31.0,93.0,-421.0,281.0,-156.0,-125.0,-156.0,-296.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 5).abs / 5.0]
   #      p"5"
   #       # Press 10
   #      @info.x_motion = "312.0,62.0,125.0,375.0,46.0,406.0,265.0,218.0,250.0,312.0,93.0,515.0,156.0,312.0,343.0,281.0,234.0,500.0,906.0,609.0,"
   #      @info.y_motion = "906.0,734.0,890.0,1640.0,578.0,1187.0,1234.0,937.0,1343.0,859.0,593.0,1421.0,765.0,843.0,1140.0,703.0,750.0,1203.0,-687.0,-656.0,"
   #      @info.z_motion = "-140.0,-15.0,156.0,140.0,0.0,296.0,62.0,156.0,234.0,125.0,-31.0,46.0,0.0,62.0,156.0,171.0,93.0,125.0,-296.0,-328.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 10).abs / 10.0]
   #      p"10"
   #      # Row/Curl
   #      @info.x_motion = "250.0,-734.0,-437.0,-531.0,-1093.0,-296.0,-953.0,-437.0,-750.0,-687.0,-750.0,-156.0,343.0,15.0,"
   #      @info.y_motion = "-718.0,-203.0,-218.0,-140.0,281.0,140.0,546.0,531.0,328.0,500.0,218.0,265.0,-421.0,-15.0,"
   #      @info.z_motion = "1296.0,-1000.0,-796.0,-421.0,-781.0,-640.0,-703.0,-828.0,-531.0,-718.0,-515.0,-593.0,984.0,1031.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"


   #      # Press
   #      @info.x_motion = "406.0,453.0,421.0,312.0,968.0,234.0,203.0,187.0,140.0,828.0,656.0,"
   #      @info.y_motion = "859.0,1562.0,1734.0,1203.0,1984.0,1125.0,562.0,890.0,546.0,-765.0,-718.0,"
   #      @info.z_motion = "-31.0,-31.0,125.0,203.0,343.0,359.0,78.0,-31.0,250.0,-328.0,-296.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"

   #       # Row 10
   #      @info.x_motion = "453.0,281.0,203.0,296.0,515.0,312.0,203.0,562.0,484.0,265.0,546.0,687.0,390.0,359.0,500.0,500.0,531.0,718.0,671.0,"
   #      @info.y_motion = "-843.0,-1125.0,15.0,-1281.0,-1234.0,-781.0,-421.0,-1109.0,-1062.0,-390.0,-1093.0,-1015.0,-1000.0,-843.0,-1015.0,-1000.0,-843.0,-687.0,-734.0,"
   #      @info.z_motion = "-46.0,-203.0,343.0,-78.0,-421.0,234.0,343.0,-328.0,-234.0,203.0,-234.0,-312.0,125.0,31.0,-218.0,62.0,-218.0,-250.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 10).abs / 10.0]
   #      p"10"
   #       # Press 12
   #      @info.x_motion = "718.0,218.0,484.0,218.0,375.0,484.0,312.0,250.0,687.0,218.0,359.0,437.0,218.0,484.0,484.0,343.0,703.0,312.0,171.0,531.0,796.0,656.0,"
   #      @info.y_motion = "-453.0,562.0,1375.0,687.0,875.0,984.0,750.0,796.0,1500.0,671.0,812.0,921.0,515.0,906.0,1046.0,781.0,1265.0,531.0,609.0,171.0,-656.0,-750.0,"
   #      @info.z_motion = "31.0,-46.0,187.0,0.0,156.0,171.0,109.0,109.0,187.0,62.0,93.0,93.0,-109.0,234.0,78.0,-281.0,203.0,-46.0,-203.0,156.0,-187.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 12).abs / 12.0]
   #      p"12"
   #       # Press 8
   #      @info.x_motion = "500.0,140.0,343.0,468.0,328.0,421.0,156.0,203.0,359.0,125.0,531.0,218.0,218.0,296.0,968.0,703.0,"
   #      @info.y_motion = "390.0,265.0,984.0,843.0,1125.0,953.0,703.0,1046.0,1031.0,656.0,1203.0,875.0,937.0,1031.0,-578.0,-656.0,"
   #      @info.z_motion = "15.0,31.0,-62.0,62.0,-46.0,62.0,78.0,-62.0,0.0,187.0,-62.0,125.0,0.0,-46.0,-515.0,-296.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 8).abs / 8.0]
   #      p"8"
   #       # Press 2
   #      @info.x_motion = "171.0,250.0,515.0,171.0,484.0,546.0,"
   #      @info.y_motion = "875.0,656.0,1031.0,750.0,453.0,-843.0,"
   #      @info.z_motion = "203.0,156.0,640.0,46.0,484.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 2).abs / 2.0]
   #      p"2"
   #       # Row 7
   #      @info.x_motion = "515.0,250.0,156.0,296.0,343.0,406.0,171.0,609.0,468.0,265.0,640.0,296.0,562.0,"
   #      @info.y_motion = "-843.0,-1109.0,109.0,-1078.0,-1125.0,-1000.0,31.0,-1328.0,-937.0,-421.0,-1203.0,-593.0,-671.0,"
   #      @info.z_motion = "-140.0,-140.0,453.0,31.0,-93.0,109.0,562.0,-328.0,-62.0,359.0,-359.0,187.0,-265.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 7).abs / 7.0]
   #      p"7"
   #      # Row 15
   #      @info.x_motion = "343.0,265.0,531.0,390.0,359.0,546.0,515.0,546.0,562.0,453.0,609.0,578.0,250.0,796.0,515.0,140.0,640.0,578.0,218.0,781.0,531.0,468.0,343.0,453.0,640.0,656.0,"
   #      @info.y_motion = "-906.0,-859.0,-1234.0,-1000.0,-906.0,-1156.0,-968.0,-1156.0,-953.0,-609.0,-1031.0,-906.0,-203.0,-1140.0,-1000.0,125.0,-1046.0,-1046.0,-203.0,-1156.0,-953.0,-875.0,-875.0,-890.0,-812.0,-718.0,"
   #      @info.z_motion = "156.0,140.0,-328.0,78.0,93.0,-250.0,62.0,-156.0,-234.0,125.0,-312.0,-125.0,234.0,-484.0,-125.0,531.0,-218.0,46.0,359.0,-359.0,-156.0,234.0,-15.0,-218.0,-265.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 15).abs / 15.0]
   #      p"15"
   #      # Press 4 (HARD)
   #      @info.x_motion = "968.0,343.0,500.0,390.0,593.0,250.0,656.0,265.0,437.0,781.0,609.0,671.0,"
   #      @info.y_motion = "-1000.0,671.0,921.0,890.0,906.0,625.0,812.0,468.0,984.0,-859.0,-765.0,-718.0,"
   #      @info.z_motion = "-546.0,-46.0,234.0,-31.0,-46.0,156.0,-31.0,15.0,78.0,-375.0,-281.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 4).abs / 4.0]
   #      p"4"


   #      # Curl 7 
   #      @info.x_motion = "515.0,593.0,609.0,734.0,578.0,484.0,640.0,609.0,656.0,640.0,562.0,609.0,437.0,437.0,671.0,"
   #      @info.y_motion = "-859.0,-62.0,-1015.0,-93.0,-1046.0,-1187.0,46.0,-1359.0,-1031.0,-546.0,-1093.0,-125.0,-859.0,-890.0,-656.0,"
   #      @info.z_motion = "-281.0,0.0,-250.0,-62.0,-296.0,-312.0,-46.0,-265.0,-265.0,-78.0,-343.0,-31.0,-187.0,-296.0,-296.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 7).abs / 7.0]
   #      p"7"

   #      # Row 7
   #      @info.x_motion = "484.0,812.0,687.0,906.0,859.0,296.0,437.0,906.0,1171.0,921.0,828.0,703.0,671.0,687.0,"
   #      @info.y_motion = "-671.0,-906.0,-703.0,-718.0,-734.0,-250.0,-421.0,-859.0,-968.0,-1031.0,-734.0,-609.0,-640.0,-687.0,"
   #      @info.z_motion = "-203.0,-62.0,125.0,-31.0,109.0,140.0,203.0,31.0,-31.0,46.0,187.0,-171.0,-312.0,-265.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 7).abs / 7.0]
   #      p"7"

   #      # Row 8
   #      @info.x_motion = "703.0,484.0,312.0,1078.0,1031.0,812.0,187.0,750.0,859.0,953.0,437.0,750.0,671.0,656.0,"
   #      @info.y_motion = "-734.0,-359.0,-359.0,-1203.0,-1031.0,-968.0,-15.0,-890.0,-843.0,-906.0,-250.0,-734.0,-718.0,-734.0,"
   #      @info.z_motion = "15.0,156.0,390.0,-31.0,62.0,171.0,343.0,0.0,125.0,203.0,312.0,62.0,-328.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 8).abs / 8.0]
   #      p"8"
   #      # Curl 7
   #      @info.x_motion = "765.0,609.0,671.0,656.0,593.0,718.0,718.0,625.0,625.0,578.0,453.0,640.0,515.0,484.0,"
   #      @info.y_motion = "-437.0,-1000.0,109.0,-1031.0,250.0,-1093.0,-625.0,-671.0,-1031.0,109.0,-1265.0,-234.0,-937.0,-859.0,"
   #      @info.z_motion = "-125.0,-171.0,-31.0,-203.0,31.0,-265.0,-203.0,-203.0,-312.0,-31.0,-156.0,-140.0,-265.0,-218.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 7).abs / 7.0]
   #      p"7"
   #      # Press 10
   #      @info.x_motion = "750.0,843.0,859.0,1093.0,1093.0,609.0,1578.0,1015.0,515.0,1375.0,1078.0,515.0,1640.0,593.0,984.0,1609.0,906.0,859.0,937.0,671.0,"
   #      @info.y_motion = "-906.0,-15.0,343.0,250.0,312.0,93.0,265.0,234.0,218.0,312.0,46.0,93.0,312.0,187.0,125.0,437.0,109.0,203.0,-484.0,-703.0,"
   #      @info.z_motion = "-296.0,-218.0,-31.0,-125.0,-62.0,-171.0,-109.0,-109.0,-140.0,-187.0,-250.0,-140.0,-140.0,-109.0,-171.0,-218.0,-250.0,-46.0,-62.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 10).abs / 10.0]
   #      p"10"
   #      # Row 12
   #      @info.x_motion = "765.0,906.0,296.0,328.0,265.0,0.0,812.0,984.0,765.0,968.0,1015.0,1203.0,-125.0,843.0,781.0,671.0,"
   #      @info.y_motion = "-1156.0,-1093.0,-234.0,-250.0,-156.0,46.0,-750.0,-859.0,-796.0,-828.0,-828.0,-984.0,218.0,-703.0,-546.0,-718.0,"
   #      @info.z_motion = "-218.0,-46.0,31.0,109.0,109.0,171.0,187.0,250.0,156.0,93.0,203.0,46.0,218.0,-234.0,-343.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 12).abs / 12.0]
   #      p"12"
   #      # Press 6
   #      @info.x_motion = "687.0,843.0,765.0,1156.0,875.0,1437.0,890.0,1187.0,890.0,1296.0,765.0,1390.0,765.0,890.0,875.0,625.0,"
   #      @info.y_motion = "-843.0,109.0,125.0,234.0,296.0,312.0,203.0,250.0,109.0,250.0,234.0,296.0,171.0,156.0,-546.0,-828.0,"
   #      @info.z_motion = "-250.0,-156.0,-93.0,-78.0,-93.0,-93.0,15.0,203.0,-171.0,171.0,-140.0,-46.0,-78.0,-109.0,-62.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally +=1
   #      p "Shoulder Press"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 6).abs / 6.0]
   #      p"6"
   #      # Curl 4
   #      @info.x_motion = "593.0,609.0,703.0,625.0,765.0,671.0,546.0,359.0,656.0,656.0,"
   #      @info.y_motion = "140.0,-1328.0,-937.0,-609.0,-921.0,-562.0,-937.0,-906.0,-765.0,-734.0,"
   #      @info.z_motion = "-156.0,-171.0,-218.0,-140.0,-250.0,-187.0,-265.0,-312.0,-296.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 4).abs / 4.0]
   #      p"4"
   #      # Row 9
   #      @info.x_motion = "906.0,875.0,453.0,859.0,343.0,1250.0,1296.0,1156.0,1296.0,1125.0,1031.0,562.0,656.0,"
   #      @info.y_motion = "-843.0,-875.0,-171.0,-812.0,-265.0,-1046.0,-1031.0,-953.0,-1156.0,-875.0,-812.0,-640.0,-734.0,"
   #      @info.z_motion = "-218.0,-46.0,62.0,218.0,109.0,-218.0,-218.0,31.0,-250.0,-125.0,46.0,-265.0,-296.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally +=1
   #      p "Row"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 9).abs / 9.0]
   #      p"9"
   #      # Curl 4
   #      @info.x_motion = "750.0,843.0,265.0,750.0,546.0,625.0,687.0,343.0,796.0,859.0,500.0,437.0,562.0,687.0,"
   #      @info.y_motion = "-906.0,-343.0,-1234.0,-593.0,-859.0,-921.0,328.0,-953.0,-531.0,-15.0,-937.0,-875.0,-812.0,-703.0,"
   #      @info.z_motion = "-218.0,-187.0,-218.0,-140.0,-250.0,-171.0,62.0,-187.0,-171.0,-46.0,-187.0,-234.0,-265.0,-281.0,"
   #      correct += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally +=1
   #      p "Curl"
   #      error += [(Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion) - 4).abs / 4.0]
   #      p"4"

   #      p "Mainly Rotated Results:"
   #      #Mainly Rotated Results ===================
   #      correct_rot = 0
   #      tally_rot = 0

   #      # Curl
   #      @info.x_motion = "1000.0,828.0,1125.0,1250.0,0.0,1234.0,-281.0,953.0,1203.0,500.0,1312.0,468.0,921.0,656.0,"
   #      @info.y_motion = "-328.0,-375.0,-109.0,-46.0,-718.0,-156.0,-718.0,-312.0,-234.0,-546.0,0.0,-671.0,-296.0,-750.0,"
   #      @info.z_motion = "-218.0,-125.0,-109.0,-187.0,-15.0,-203.0,78.0,-140.0,-140.0,-46.0,-171.0,-140.0,-234.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally_rot +=1
   #      p "Curl"

   #      # Press
   #      @info.x_motion = "671.0,656.0,1593.0,562.0,1265.0,968.0,765.0,1000.0,1140.0,640.0,1250.0,578.0,1015.0,984.0,640.0,921.0,468.0,656.0,656.0,"
   #      @info.y_motion = "-421.0,-171.0,-156.0,-31.0,-140.0,62.0,93.0,31.0,-109.0,-62.0,-62.0,31.0,-265.0,-250.0,-234.0,-46.0,-1109.0,-734.0,-734.0,"
   #      @info.z_motion = "15.0,-31.0,-390.0,-171.0,-109.0,15.0,-78.0,15.0,-93.0,-171.0,-109.0,-125.0,-93.0,-203.0,-234.0,-140.0,-140.0,-265.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally_rot +=1
   #      p "Shoulder Press"

   #      # Curl
   #      @info.x_motion = "-187.0,1140.0,1125.0,1125.0,921.0,1203.0,750.0,421.0,1218.0,703.0,1187.0,937.0,718.0,703.0,"
   #      @info.y_motion = "-671.0,-640.0,-671.0,-703.0,-343.0,-468.0,-781.0,-765.0,-562.0,-734.0,-609.0,-703.0,-734.0,-718.0,"
   #      @info.z_motion = "93.0,-250.0,-343.0,-312.0,-93.0,-187.0,-140.0,-125.0,-281.0,-187.0,-375.0,-359.0,-265.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally_rot +=1
   #      p "Curl"

   #      # Row
   #      @info.x_motion = "750.0,1265.0,656.0,406.0,-203.0,-171.0,843.0,734.0,250.0,500.0,437.0,750.0,796.0,687.0,"
   #      @info.y_motion = "-515.0,-875.0,-796.0,-578.0,-15.0,-109.0,-937.0,-750.0,-484.0,-640.0,-453.0,-843.0,-578.0,-734.0,"
   #      @info.z_motion = "-281.0,-531.0,-453.0,-453.0,-296.0,-343.0,-531.0,-562.0,-421.0,-578.0,-500.0,-515.0,-250.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally_rot +=1
   #      p "Row"


   #      # Press
   #      @info.x_motion = "437.0,46.0,609.0,718.0,1250.0,703.0,437.0,953.0,765.0,687.0,937.0,593.0,718.0,937.0,328.0,375.0,"
   #      @info.y_motion = "-859.0,-843.0,-468.0,-468.0,-1312.0,-687.0,-390.0,-593.0,-421.0,-281.0,-656.0,-484.0,-437.0,-531.0,-1156.0,-937.0,"
   #      @info.z_motion = "-281.0,-500.0,-234.0,-312.0,-453.0,-109.0,-203.0,-375.0,-187.0,-265.0,-234.0,-140.0,-250.0,-343.0,-296.0,-296.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally_rot +=1
   #      p "Shoulder Press"

   #      # 
   #      @info.x_motion = "1125.0,968.0,1234.0,1250.0,656.0,1359.0,1062.0,-312.0,1156.0,31.0,1203.0,-312.0,687.0,1234.0,875.0,687.0,"
   #      @info.y_motion = "-609.0,-437.0,-296.0,-234.0,-625.0,-46.0,-343.0,-546.0,-250.0,-656.0,-78.0,-671.0,-750.0,-234.0,-484.0,-703.0,"
   #      @info.z_motion = "-312.0,-78.0,-140.0,-93.0,-93.0,-296.0,-234.0,125.0,-140.0,93.0,-62.0,93.0,-125.0,-93.0,-234.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally_rot +=1
   #      p "Curl"

   #      # 
   #      @info.x_motion = " 750.0,1281.0,859.0,953.0,968.0,1281.0,859.0,515.0,859.0,984.0,500.0,1125.0,515.0,1015.0,1359.0,640.0,1031.0,937.0,656.0,"
   #      @info.y_motion = "-734.0,-562.0,-468.0,-437.0,-312.0,-562.0,-343.0,-187.0,-375.0,-546.0,-203.0,-484.0,-406.0,-421.0,-546.0,-312.0,-265.0,-484.0,-750.0,"
   #      @info.z_motion = "-140.0,-234.0,-453.0,-234.0,-187.0,-500.0,-296.0,-234.0,-343.0,-281.0,-265.0,-78.0,-281.0,-203.0,-437.0,-421.0,-296.0,-203.0,-296.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally_rot +=1
   #      p "Shoulder Press"

   #      # 
   #      @info.x_motion = "312.0,-109.0,359.0,375.0,453.0,515.0,421.0,375.0,406.0,109.0,406.0,515.0,437.0,562.0,671.0,"
   #      @info.y_motion = "-890.0,-140.0,-1156.0,-1281.0,-1421.0,-1234.0,-1015.0,-953.0,-953.0,-656.0,-750.0,-1203.0,-1093.0,-546.0,-703.0,"
   #      @info.z_motion = "-484.0,-187.0,-609.0,-578.0,-703.0,-765.0,-781.0,-703.0,-828.0,-468.0,-718.0,-781.0,-625.0,-296.0,-281.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally_rot +=1
   #      p "Row"

   #      # 
   #      @info.x_motion = "546.0,-46.0,734.0,-125.0,1140.0,281.0,1031.0,140.0,1000.0,312.0,1078.0,109.0,953.0,359.0,984.0,343.0,609.0,796.0,765.0,"
   #      @info.y_motion = "-625.0,-859.0,-921.0,-703.0,-375.0,-937.0,-468.0,-750.0,-656.0,-750.0,-234.0,-750.0,-500.0,-859.0,-406.0,-765.0,-796.0,-421.0,-656.0,"
   #      @info.z_motion = " -421.0,-78.0,-390.0,15.0,-218.0,-62.0,-187.0,-31.0,-203.0,-125.0,-234.0,-62.0,-203.0,-93.0,-328.0,-140.0,-171.0,-187.0,-171.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally_rot +=1
   #      p "Curl"

   #      # 
   #      @info.x_motion = "1125.0,1281.0,1140.0,937.0,515.0,1375.0,1234.0,187.0,-484.0,921.0,1265.0,203.0,531.0,1406.0,750.0,671.0,"
   #      @info.y_motion = "-640.0,-421.0,-531.0,-515.0,-546.0,-515.0,-406.0,-375.0,-359.0,-343.0,-296.0,-531.0,-562.0,-250.0,-609.0,-703.0,"
   #      @info.z_motion = "-250.0,-250.0,-218.0,-125.0,-125.0,-156.0,-265.0,93.0,281.0,-46.0,-203.0,46.0,-62.0,-171.0,-296.0,-250.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Curl"
   #      tally_rot +=1
   #      p "Curl"

   #      # 
   #      @info.x_motion = "531.0,1046.0,906.0,984.0,937.0,796.0,843.0,968.0,968.0,1109.0,906.0,1109.0,718.0,1203.0,640.0,1203.0,687.0,953.0,1000.0,625.0,"
   #      @info.y_motion = "-656.0,-390.0,-156.0,-93.0,-109.0,0.0,-203.0,-46.0,-187.0,-281.0,-156.0,-265.0,-218.0,-390.0,-218.0,-296.0,46.0,31.0,-484.0,-703.0,"
   #      @info.z_motion = "-140.0,-281.0,-406.0,-343.0,-328.0,-171.0,-250.0,-234.0,-265.0,-296.0,-218.0,-203.0,-187.0,-250.0,-171.0,-171.0,-234.0,-187.0,-31.0,-281.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally_rot +=1
   #      p "Shoulder Press"

   #      # 
   #      @info.x_motion = "687.0,734.0,1281.0,906.0,437.0,500.0,1250.0,1703.0,625.0,484.0,609.0,1468.0,1156.0,453.0,1031.0,515.0,671.0,"
   #      @info.y_motion = "-1078.0,-359.0,-468.0,-375.0,-359.0,-265.0,-328.0,109.0,-109.0,-203.0,-109.0,-500.0,-359.0,-140.0,-234.0,-640.0,-750.0,"
   #      @info.z_motion = "31.0,-234.0,-406.0,-359.0,-140.0,-312.0,-218.0,-453.0,-281.0,-203.0,-125.0,-375.0,-203.0,-156.0,-265.0,156.0,-281.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Shoulder Press"
   #      tally_rot +=1
   #      p "Shoulder Press"

   #      # 
   #      @info.x_motion = "390.0,250.0,296.0,218.0,296.0,140.0,-78.0,203.0,203.0,-31.0,359.0,140.0,125.0,218.0,234.0,-93.0,281.0,406.0,718.0,671.0,"
   #      @info.y_motion = "-625.0,-843.0,-1031.0,-843.0,-1078.0,-953.0,-375.0,-968.0,-1000.0,-703.0,-1296.0,-937.0,-796.0,-765.0,-937.0,-250.0,-765.0,-906.0,-843.0,-734.0,"
   #      @info.z_motion = "-531.0,-437.0,-546.0,-562.0,-421.0,-734.0,-437.0,-640.0,-625.0,-421.0,-640.0,-609.0,-656.0,-640.0,-593.0,-234.0,-796.0,-250.0,-359.0,-281.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally_rot +=1
   #      p "Row"

   #      # 
   #      @info.x_motion = "484.0,531.0,703.0,734.0,687.0,843.0,890.0,1031.0,625.0,265.0,750.0,921.0,703.0,687.0,"
   #      @info.y_motion = "-515.0,-828.0,-1125.0,-1203.0,-1000.0,-968.0,-906.0,-1156.0,-796.0,-515.0,-1093.0,-890.0,-437.0,-640.0,"
   #      @info.z_motion = "-500.0,-640.0,-718.0,-921.0,-734.0,-656.0,-593.0,-921.0,-843.0,-625.0,-734.0,-1093.0,-312.0,-265.0,"
   #      correct_rot += 1 if @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion) == "Row"
   #      tally_rot +=1
   #      p "Row"

   #      # 
   #      # @info.x_motion = ""
   #      # @info.y_motion = ""
   #      # @info.z_motion = ""

   #      # 
   #      # @info.x_motion = ""
   #      # @info.y_motion = ""
   #      # @info.z_motion = ""

   #      # 
   #      # @info.x_motion = ""
   #      # @info.y_motion = ""
   #      # @info.z_motion = ""






 		# @info.exercise_name = @info.classify_exercise(@info.x_motion,@info.y_motion,@info.z_motion)
 		# @info.reps_counted = Rep.rep_predict(@info.x_motion,@info.y_motion,@info.z_motion)
 		# @info.save
        
	    @data = Ibeacon.all

   #      end_time = Time.now
   #      p "this took: " + (end_time - beginning_time).to_s + "  seconds!"
   #      p "========================"
   #      p "Master Score Normal: " + correct.to_s + " / " + tally.to_s
   #      p "========================"
   #      p "Master Score Rotated: " + correct_rot.to_s + " / " + tally_rot.to_s
   #      p "========================"
   #      p "Average Rep Error %: " + (100*error.mean).to_s
   #      p "========================"
	end
	
	def new
	end
	
	def create
		@info = Ibeacon.new 
		@info.x_motion = beacon_params["x_motion"]
 		@info.y_motion = beacon_params["y_motion"]
 		@info.z_motion = beacon_params["z_motion"]
 		@info.exercise_name = @info.classify_exercise(beacon_params["x_motion"],beacon_params["y_motion"],beacon_params["z_motion"])
 		@info.reps_counted = Rep.rep_predict(beacon_params["x_motion"],beacon_params["y_motion"],beacon_params["z_motion"])
 		@info.save
		redirect_to ibeacons_path
	end
	
	
	private
	
	def beacon_params
		params.require(:ibeacon).permit(:x_motion, :y_motion, :z_motion)
	end 
end
