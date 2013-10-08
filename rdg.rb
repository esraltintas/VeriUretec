i = 1
howmuchint = 0 
howmuchindex = 0 
howmuchchar = 0 
howmuchdate = 0 
howmuchmail  = 0
int = []
date = []
char = []
mail = []
numberindex = []
numberint = []
numberchar = []
numberdate = []
numbermail = []
file = IO.readlines("/home/esra/VeriUretec/dosya.txt") #Burada dosya okunuyor ve bu bir diziye ataniyor
row1 = file[0]
row2 = file[1]
row1 = row1.split(" ") # Bosluk karakterini çıkartıp bunu baska bir diziye atadim
row2 = row2.split(" ")
a = row1.length
while (i<=a )
	
	if row1[i-1] == "index"  #ilk satirda nerede "index" var ve onun altinda toplam ne kadar "index" istendigini bulur 
		numberindex[i-1] = Integer(row2[i-1])		
		howmuchindex = howmuchindex + numberindex[i-1]
	end
	
	if row1[i-1] == "int" #ilk satirda nerede "int" var ve onun altinda toplam ne kadar "int" istendigini bulur
                numberint[i-1] = Integer(row2[i-1])
		howmuchint = howmuchint + numberint[i-1]
        end
	
	if row1[i-1] == "char" #ilk satirda nerede "char" var ve onun altinda toplam ne kadar "char" istendigini bulur
		numberchar[i-1] = Integer(row2[i-1])
                howmuchchar = howmuchchar + numberchar[i-1]
        end
	
	if row1[i-1] == "date" #ilk satirda nerede "date" var ve onun altinda toplam ne kadar "date" istendigini bulur
		numberdate[i-1] = Integer(row2[i-1])
                howmuchdate = howmuchdate + numberdate[i-1] 
        end
	
	if row1[i-1] == "email" #ilk satirda nerede "email" var ve onun altinda toplam ne kadar "email" istendigini bulur
		numbermail[i-1] = Integer(row2[i-1])
                howmuchmail = howmuchmail + numbermail[i-1]
        end
	i = i+1	
end

gdata = File.new("/home/esra/VeriUretec/data.txt", "w") #Yeni bir dosya olusturdum ve buna yazma izni verdim

def self.randomchar(length = howmuchchar)
	    (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).sort_by {rand}[0,1].join # a dan zye dosyada kac karakter istiyorsa o kadar karakter secer
end

def self.randomdate(length = howmuchdate)
	((('01'..'30').to_a).sort_by {rand}[0,1].join + "." + (('01'..'12').to_a).sort_by {rand}[0,1].join + "." + (('1990'..'2999').to_a).sort_by {rand}[0,1].join)  
end

def self.randommail(length = howmuchmail)
	tld  = [".com", ".org", ".net", ".us", ".tl", ".tr"]
	host = ["@mail", "@gmail", "@qmail", "@hotmail", "@kmail", "@ipsum"]
	((0...4).map{ ('a'..'z').to_a[rand(29)] }.join + (host.to_a).sort_by {rand}[0,1].join + (tld.to_a).sort_by {rand}[0,1].join)
end
i = 1
while (i<=howmuchindex)
	j=1
	while (j <= howmuchint) # Ne kadar integer deger uretilmek isteniyorsa o kadar integer degeri rasgele secer
		int[j-1] = rand(9)
		j = j+1
	end
	
	j=1
	while (j <= howmuchchar) # Ne kadar karakter uretilmek isteniyorsa o kadar karakteri rasgele secer
                char[j-1] = self.randomchar(howmuchchar)
		j = j+1
        end
	
	j=1
	while (j <= howmuchdate) # Ne kadar tarih uretilmek isteniyorsa o kadar tarihi rasgele secer
                date[j-1] = self.randomdate(howmuchdate)
		j=j+1
        end
	
	j=1
	while (j <= howmuchmail) # Ne kadar mail uretilmek isteniyorsa o kadar maili rasgele secer
                mail[j-1] = self.randommail(howmuchmail)
		j = j+1
        end          
	gdata.puts("#{i} #{int * ","} #{char * ","} #{date * ","} #{mail * ","}") # Rasgele olusturulmus degerleri olusturdugum dosya icine yazdirdim
	i = i +1
end
gdata.close
