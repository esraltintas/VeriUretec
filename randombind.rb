pv=[10,20] #preference-value
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end
$randpv = pv[Random.rand(0..1)]
$rand_date = time_rand Time.now, Time.local(2014,7,1)

class BIND
	def port
		port = (('1000'..'65536').to_a).sort_by {rand}[0,1].join
	end

	def time
		next_date = time_rand $rand_date, Time.local(2014,7,1)
		$rand_date = next_date
	end	

	def ip
		ip = ((('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join)

	end
	
	def URL
                tld  = [".com", ".org", ".net", ".us", ".tl", ".tr"]

                url = ((('0'..'10').to_a).sort_by {rand}[0,1].join + "." + (0...8).map{ ('a'..'z').to_a[rand(29)] }.join  + (tld.to_a).sort_by {rand}[0,1].join)
	end


	
	def arecord
		return   time().to_s + "queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" +  URL() + " IN A #$ip"
	end

	def cname

		return  time().to_s + "queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" + URL() + "mail IN CNAME " + URL()
		
	end

	def mx
		url = URL()
		return  time().to_s + "queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" +  url + " IN MX " + "#$randpv " + url
	end
	
	def nameserver

		return  time().to_s + "queries: info: client " + ip() + " #  " + port() + "  :  \  \n" + "  query:" + "IN NS " + URL()
	end
		
end

bind =BIND.new
puts bind.arecord()
puts bind.mx()
puts bind.cname()
puts bind.nameserver()


	
	


		
