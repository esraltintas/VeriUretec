index = 1
file = File.open("/home/esra/VeriUretec/dosya.txt", "r+")
#file.puts "#{index} 42 esra 21.03.2013 es.altintas@gmail.com"
line = file.gets
while (index<10)
      file.puts "#{index} 42 esra 21.03.2013 es.altintas@gmail.com"
      puts " #{line}"
      index = index +1
end
file.close

  

