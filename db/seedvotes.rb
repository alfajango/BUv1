def seedvotes

	#--------------- Votes ------------------------------

	votes = Vote.all
	votes.delete_all

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