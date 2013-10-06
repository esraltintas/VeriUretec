i =1
int = []
array = IO.readlines("/home/esra/VeriUretec/dosya.txt")
array2 = array[1]
array3 = array2.split(" ")
satirsayisi = Integer(array3[0])
kacint = Integer(array3[1])
kacchar = Integer(array3[2])
kactarih = Integer(array3[3])
kacmail = Integer(array3[4])
gdata = File.new("/home/esra/VeriUretec/data.txt", "w")

def self.random(length=kacchar)
	    (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).sort_by {rand}[0,length].join # a dan zye dosyada kac karakter istiyorsa o kadar karakter secer
end
while (i<=satirsayisi)
	j=1
	while (j <= kacint)
		int[j-1] = rand(9)
		j = j+1
	end
	j=1
	while (j <= kacchar)
                char = self.random(kacchar)
		j = j+1
        end
#	j=1
#	while (j <= kactarih)
 #               int[j-1] = rand(9)
#		j=j+1
 #       end
#	j=1
#	while (j <= kacchar)
 #               int[j-1] = rand(9)
  #      end          
	gdata.puts("#{i} #{int} #{char} 121")
	i = i +1
end
gdata.close
