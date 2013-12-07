def time_rand from = 0.0, to = Time.now
	Time.at(from + rand * (to.to_f - from.to_f))
end


class Function
	
	$rand_date = time_rand Time.now, Time.local(2014,7,1)	

#	def time_rand from = 0.0, to = Time.now
 # 		Time.at(from + rand * (to.to_f - from.to_f))
#	end

	
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
end

