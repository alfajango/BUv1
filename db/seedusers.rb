#--------------- Users ------------------------------
def seedusers()


	users = User.all
	users.each do |user|
		# puts "user.name: #{user.name}"
		domain = user.email.split("@").last 
		if (domain=="in-itech.com" or domain=="example.com" or user.email==ENV['ADMIN_EMAIL']) 
			puts "deleted #{user.name}"
			user.delete
		end
	end

	###users.delete_all
	# in case it creates companies & projects, also will need to delete In-itech and example
	#  projects & companies here

	user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, 
				:password => ENV['ADMIN_PASSWORD'].dup, 
				:password_confirmation => ENV['ADMIN_PASSWORD'].dup		
	# user.confirm!	# so that I won't get "need to confirm email" when logging in

	user = User.create!(name: "Jane Williams", email: "jwilliams@example.com", password: "pass1word", 
				password_confirmation: "pass1word")
	# user.confirm!

	#temp_user = User.find_by(name: "Jane Williams")
	user = User.create!(name: "Bill Jones", email: "bjones@example.com", password: "pass3word", 
				password_confirmation: "pass3word")
	# user.confirm!

	#temp_user = User.find_by(name: "Bill Jones")
	user = User.create!(name: "Beth Hillman", email: "bhillman@example.com", password: "pass4word", 
				password_confirmation: "pass4word")
	# user.confirm!

	user = User.create!(name: "Trevor Carawell", email: "tcarawell@example.com", password: "pass6word", 
				password_confirmation: "pass6word")
	# user.confirm!

	user = User.create!(name: "Phil Garber", email: "phil@example.com", password: "pass7word", 
				password_confirmation: "pass7word")
	# user.confirm!

	user = User.create!(name: "Peter Gibbons", email: "pgibbons@in-itech.com", password: "pass8word", 
				password_confirmation: "pass8word")
	# user.confirm!

	user = User.create!(name: "Bill Lumbergh", email: "BLumbergh@in-itech.com", password: "pass9word", 
				password_confirmation: "pass9word")
	# user.confirm!

	user = User.create!(name: "Samir Nagheenanajar", email: "samir@in-itech.com", password: "pass10word", 
				password_confirmation: "pass10word")
	# user.confirm!

	user = User.create!(name: "Michael Bolton", email: "mbolton@in-itech.com", password: "pass4word", 
				password_confirmation: "pass4word")
	# user.confirm!

	user = User.create!(name: "Milton Waddams", email: "milton@in-itech.com", password: "pass3word", 
				password_confirmation: "pass3word")
	# user.confirm!
	puts 'DEFAULT USERS'
end