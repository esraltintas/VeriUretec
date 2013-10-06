i =1
int = []
date = []
char = []
mail = []
array = IO.readlines("/home/esra/VeriUretec/dosya.txt") #Burada dosya okunuyor ve bu bir diziye ataniyor
array2 = array[1]
array3 = array2.split(" ") # Bosluk karakterini çıkartıp bunu baska bir diziye atadim
satirsayisi = Integer(array3[0]) # Dizide elemanlar karakter oldugu için once sayi haline getirdim
kacint = Integer(array3[1])
kacchar = Integer(array3[2])
kactarih = Integer(array3[3])
kacmail = Integer(array3[4])
gdata = File.new("/home/esra/VeriUretec/data.txt", "w") #Yeni bir dosya olusturdum ve buna yazma izni verdim

def self.randomchar(length = kacchar)
	    (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).sort_by {rand}[0,1].join # a dan zye dosyada kac karakter istiyorsa o kadar karakter secer
end

def self.randomdate(length = kactarih)
	((('01'..'30').to_a).sort_by {rand}[0,1].join + "." + (('01'..'12').to_a).sort_by {rand}[0,1].join + "." + (('1990'..'2999').to_a).sort_by {rand}[0,1].join)  
end

def self.randommail(length = kacmail)
	((0...4).map{ ('a'..'z').to_a[rand(29)] }.join + "@mail.com")
end
while (i<=satirsayisi)
	j=1
	while (j <= kacint)
		int[j-1] = rand(9)
		j = j+1
	end
	
	j=1
	while (j <= kacchar)
                char[j-1] = self.randomchar(kacchar)
		j = j+1
        end
	
	j=1
	while (j <= kactarih)
                date[j-1] = self.randomdate(kactarih)
		j=j+1
        end
	
	j=1
	while (j <= kacmail)
                mail[j-1] = self.randommail(kacmail)
		j = j+1
        end          
	gdata.puts("#{i} #{int * ","} #{char * ","} #{date * ","} #{mail * ","}") # Rasgele olusturulmus degerleri olusturdugum dosya icine yazdirdim
	i = i +1
end
gdata.close
