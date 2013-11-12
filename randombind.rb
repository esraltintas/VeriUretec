$time = Time.now
$port = (('1000'..'65536').to_a).sort_by {rand}[0,1].join
$ip = ((('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join + "." + (('0'..'250').to_a).sort_by {rand}[0,1].join)

class BIND
	
	def URL
                tld  = [".com", ".org", ".net", ".us", ".tl", ".tr"]

                url = ((('0'..'10').to_a).sort_by {rand}[0,1].join + "." + (0...8).map{ ('a'..'z').to_a[rand(29)] }.join  + (tld.to_a).sort_by {rand}[0,1].join)
	end


	
	def arecord
		return  "#$time queries: info: client #$ip #  #$port  :  \ " + "\n  query:" +  URL() + " IN A -"
	end

	#def cname
	#	return "mail IN CNAME www\n" + arecord()
		
	#end

	#def mx
	#	return "IN MX 10 mail." + mail()
	#end
	
	#def nameserver
	#	return "IN NS ns." + mail() + "\nns " + arecord()	
	#end
		
end

bind =BIND.new
puts bind.arecord()




	
	


		
