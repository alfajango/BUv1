def seedcompanies
	#--------------- Companies ------------------------------
	# # shouldn't need this since companies should be set up when user created.  But, they're not being createed  

	# companies = Company.all
	#### companies.delete_all

	companies = Company.all
	companies.each do |co|
		if co.name
			if (co.name=="In-itech" or co.name=="Example" or co.name=="Prietary")
				puts "deleting #{co.name}"
				co.delete
			end
		end
	end

	### companies.delete_all	
	Company.create!(domain: "example.com", name: "Example" )
	#Company.create!(domain: "acme.com", name: "Acme" )
	Company.create!(domain: "prietary.com", name: "Prietary" )
	Company.create!(domain: "in-itech.com", name: "In-itech" )
	#puts "Company.first.name: #{Company.first.name}"
	#puts "Company.last.name: #{Company.last.name}"
	# need to put people in those companies:
	users = User.all
	#puts "users.last.email: #{users.last.email}"
	users.each do | user |
	  domain = user.email.split("@").last
	  co = Company.find_by(domain: domain)
	  # user.company = co   # this way doesn't work
	  co.users << user  # THIS WORKS AND PREVIOUS LINE DOESNT!!!
	  #puts "co.name: #{co.name}, user.email: #{user.email}"
	end
	puts "COMPANIES"
end