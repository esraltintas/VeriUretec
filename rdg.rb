i =1
array = IO.readlines("/home/esra/VeriUretec/dosya.txt")
array2 = array[1]
array3 = array2.split(" ")
satirsayisi = Integer(array3[0])
kacint = Integer(array3[1])
kacchar = Integer(array3[2])
kactarih = Integer(array3[3])
kacmail = Integer(array3[4])
gdata = File.new("/home/esra/VeriUretec/data.txt", "w")

while (i<=satirsayisi)
	gdata.puts("#{i} ads 121")
      #file.puts "#{index} 42 esra 21.03.2013 es.altintas@gmail.com"
 #     puts " #{line}"
	i = i +1
end
gdata.close
