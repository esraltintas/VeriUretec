pv=[10,20] #preference-value
$randpv = pv[Random.rand(0..1)]
class BIND
	def port
		port = (('1000'..'65536').to_a).sort_by {rand}[0,1].join
	end
	
	def time
		date = ((('2000'..'2013').to_a).sort_by {rand}[0,1].join + "-" + (('01'..'12').to_a).sort_by {rand}[0,1].join + "-" + (('01'..'28').to_a).sort_by {rand}[0,1].join)
		time = ((('00'..'23').to_a).sort_by {rand}[0,1].join + ":" + (('00'..'59').to_a).sort_by {rand}[0,1].join + ":" + (('00'..'59').to_a).sort_by {rand}[0,1].join)
		ms = (('100'..'1000').to_a).sort_by {rand}[0,1].join

		time2 = date + " " + time + "." + ms
	end	

	def ip
		ip = ((('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join)

	end
	
	def URL
                tld  = [".com", ".org", ".net", ".us", ".tl", ".tr"]

                url = ((('0'..'10').to_a).sort_by {rand}[0,1].join + "." + (0...8).map{ ('a'..'z').to_a[rand(29)] }.join  + (tld.to_a).sort_by {rand}[0,1].join)
	end


	
	def arecord
		return  time() + " queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" +  URL() + " IN A #$ip"
	end

	def cname
		return  time() + " queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" + URL() + "mail IN CNAME " + URL()
		
	end

	def mx
		url = URL()
		return  time() + " queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" +  url + " IN MX " + "#$randpv " + url
	end
	
	def nameserver
		return  time() + " queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" + "IN NS " + URL()
	end
		
end

bind =BIND.new
puts bind.arecord()
puts bind.mx()
puts bind.cname()
puts bind.nameserver()


	
	


		
