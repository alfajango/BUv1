def seedprojects

	#--------------- Projects ------------------------------
	# delete all up top.
	#proj = Project.all
	#proj.delete_all
	# this will cause rake db:seed to fail if there's a project in the db without a company
	initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id
	projects = Project.all
	projects.each do |proj|
		if proj.company
  			if (proj.company.id==initech_id or proj.company.id==exampleco_id)
	 			puts "deleted #{proj.name}"
				proj.delete
			end
		else
			puts "proj had no company, delete it"
			proj.delete	
		end
	end

	proj = Project.create!(name: "Acquire competitors")
	company = Company.find_by(name: "Example") 
	company.projects << proj
	user = User.find_by(name: "Jane Williams")
	user.projects << proj

	proj = Project.create!(name: "Factory cost reduction")
	company.projects << proj
	user = User.find_by(name: "Bill Jones")
	user.projects << proj

	proj = Project.create!(name: "Refresh website")
	company.projects << proj
	user = User.find_by(name: "Phil Garber")
	user.projects << proj

	#Acme & Prietary projects don't have creators yet
	proj = Project.create!(name: "Refresh website")
	company = Company.find_by(name: "Acme")
	company.projects << proj  # Acme will also refresh their website
	proj = Project.create!(name: "acquire ExxonMobil")
	company.projects << proj

	company = Company.find_by(name: "Prietary")
	proj = Project.create!(name: "Launch!!")
	company.projects << proj

	proj = Project.create!(name: "Office Supply cost reduction")
	company = Company.find_by(name: "In-itech") 
	company.projects << proj
	user = User.find_by(name: "Milton Waddams")
	user.projects << proj

	#in-itech
	proj = Project.create!(name: "Think: Is this good for the company?")
	company = Company.find_by(name: "In-itech") 
	company.projects << proj
	user = User.find_by(name: "Bill Lumbergh")
	user.projects << proj

	proj = Project.create!(name: "New printer")
	company = Company.find_by(name: "In-itech") 
	company.projects << proj
	user = User.find_by(name: "Samir Nagheenanajar")
	user.projects << proj



	# put in two projects for each company.  No user created these
	#no.  I think this should be done in registrations_controller create action when a user is created
	companies = Company.all
	companies.each do | co |
	  proj = Project.create!(name: "Make our customers happy.") # . says it was set here.  I'd rather this be done by user create calling company create
	  co.projects << proj
	  proj = Project.create!(name: "Keep employees motivated and engaged.")
	  co.projects << proj
	end


	puts "PROJECTS"
	#puts "company.projects[0].name: #{company.projects[0].name}"  # projects is an array

end