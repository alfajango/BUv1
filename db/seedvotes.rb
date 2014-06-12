def seedvotes

	#--------------- Votes ------------------------------
    initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id

	votes = Vote.all
	### votes.delete_all
	votes.each do |vote|
		if vote.user
			if vote.user.company
				if (vote.user.company.id==initech_id or vote.user.company.id==exampleco_id)
	 			  puts "deleting vote from #{vote.user.name}"
				  vote.delete
				end
			end
		else #vote had no user, delete it
			puts "vote had no user, deleting it"
			vote.delete
		end
	end		

	idea = Idea.find_by(body: "Sell non-core assets such as real estate")
	user = User.find_by(name: "Beth Hillman")
	vote = Vote.create!(upvote: 1, 
						downvote: 0,
						created: Time.now,
						idea: idea,
						user: user)

	#another identical vote - should eventaully be negated
	vote = Vote.create!(upvote: 1, 
						downvote: 0,
						created: Time.now,
						idea: idea,
						user: user)

	user = User.find_by(name: "Trevor Carawell")
	vote = Vote.create!(upvote: 1, 
						downvote: 0,
						created: Time.now,
						idea: idea,
						user: user)

	user = User.find_by(name: "Jane Williams")
	vote = Vote.create!(upvote: 1, 
						downvote: 0,
						created: Time.now,
						idea: idea,
						user: user)

	user = User.find_by(name: "Phil Garber")
	vote = Vote.create!(upvote: 0, 
						downvote: 1,
						created: Time.now,
						idea: idea,
						user: user)

	puts "VOTES"
end