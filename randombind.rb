class BIND 
	def mail
		tld  = [".com", ".org", ".net", ".us", ".tl", ".tr"]
                host = ["@mail", "@gmail", "@qmail", "@hotmail", "@kmail", "@ipsum"]
                mail = ((0...4).map{ ('a'..'z').to_a[rand(29)] }.join + (host.to_a).sort_by {rand}[0,1].join + (tld.to_a).sort_by {rand}[0,1].join)

	end
	
	def arecord
		ip = ((('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join)
		return "mail IN A " +ip
	end

	def cname
		return "mail IN CNAME www\n" + arecord()
		
	end

	def mx
		return "IN MX 10 mail." + mail()
	end
	
	def nameserver
		return "IN NS ns." + mail() + "\nns " + arecord()	
	end
		
end

bind =BIND.new
puts bind.arecord()
puts bind.cname()
puts bind.mail()
puts bind.nameserver()




	
	


		
