file = File.open("/home/esra/VeriUretec/dosya.txt", "r+")
while (line = file.gets)
      puts " #{line}"
  end
  file.close
  

