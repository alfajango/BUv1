def seedideas

	#--------------- Ideas ------------------------------
    initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id

	ideas = Idea.all
	ideas.each do |idea|
		if idea.company
			if (idea.company.id==initech_id or idea.company.id==exampleco_id)
 			  puts "deleting idea #{idea.name}"
			  idea.delete
			end
		else 
			puts "idea had no company, deleting it"
			idea.delete
		end
	end	
	#### ideas = Idea.all
	#### ideas.delete_all

	idea = Idea.create!(body: "Sell non-core assets such as real estate", created: Time.now)
	co = Company.find_by(name: "Example")
	co.ideas << idea # idea belongs to company
	user = User.find_by(name: "Jane Williams")
	user.ideas << idea # idea belongs to user
	# leave thread null - it's it's own idea

	idea = Idea.create!(body: "Increase funding for product development", created: Time.now)
	co = Company.find_by(name: "Example")
	co.ideas << idea # idea belongs to company
	user = User.find_by(name: "Jane Williams")
	user.ideas << idea # idea belongs to user
	# leave thread null - it's it's own idea

	idea = Idea.create!(body: "Get out of markets where we aren't number 1 or number 2", created: Time.now)
	co = Company.find_by(name: "Example")
	co.ideas << idea # idea belongs to company
	user = User.find_by(name: "Beth Hillman")
	user.ideas << idea # idea belongs to user
	# leave thread null - it's it's own idea

	parent = Idea.find_by(body: "Sell non-core assets such as real estate")
	idea = Idea.create!(body: "Real estate is a great investment long term.  Plus, this is not a good time to sell", 
						created: Time.now,
						thread: parent)
	co = Company.find_by(name: "Example")
	co.ideas << idea # idea belongs to company
	user = User.find_by(name: "Trevor Carawell")
	user.ideas << idea # idea belongs to user
	# parent.thread = idea  # ?

	parent = Idea.find_by(body: "Real estate is a great investment long term.  Plus, this is not a good time to sell")
	idea = Idea.create!(body: "Our cost of capital is higher than real estate appreciation, so we should sell", 
						created: Time.now, 
						thread: parent)
	co = Company.find_by(name: "Example")
	co.ideas << idea 
	user = User.find_by(name: "Beth Hillman")
	user.ideas << idea # idea belongs to user
	# parent.thread = idea  

	co = Company.find_by(name: "Example")
	user = User.find_by(name: "Beth Hillman")
	parent = Idea.find_by(body: "Sell non-core assets such as real estate")

	# also works: idea = Idea.new( ... )

	idea = Idea.create!(body: "Where do we work if we sell the real estate?", 
						created: Time.now,
						company: co,
						user: user,
						thread: parent)


	co = Company.find_by(name: "In-itech")
	user = User.find_by(name: "Samir Nagheenanajar")
	body = "Bring in consultants"
	idea = Idea.create!(body: body, 
						created: Time.now,
						company: co,
						user: user)

	user = User.find_by(name: "Milton Waddams")
	body = "More clarity in the payroll process"
	idea = Idea.create!(body: body, 
						created: Time.now,
						company: co,
						user: user)

	user = User.find_by(name: "Michael Bolton")
	body = "The previous TPS Report format was better"
	idea = Idea.create!(body: body, 
						created: Time.now,
						company: co,
						user: user)
	# this also works:
	# co.ideas << idea 
	# user.ideas << idea 
	#parent.thread = idea 

	puts "IDEAS"
end