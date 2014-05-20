#--------------- Users ------------------------------
def seedusers()
	users = User.all
	users.delete_all
	# in case it creates companies & projects, also do this:
	companies = Company.all
	companies.delete_all
	proj = Project.all
	proj.delete_all

	puts 'DEFAULT USERS'
	user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, 
				:password => ENV['ADMIN_PASSWORD'].dup, 
				:password_confirmation => ENV['ADMIN_PASSWORD'].dup		
	user.confirm!	# so that I won't get "need to confirm email" when logging in
	user = User.create!(name: "Jane Williams", email: "jwilliams@example.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	#temp_user = User.find_by(name: "Jane Williams")
	user = User.create!(name: "Bill Jones", email: "bjones@example.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	#temp_user = User.find_by(name: "Bill Jones")
	user = User.create!(name: "Beth Hillman", email: "bhillman@example.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Trevor Carawell", email: "tcarawell@example.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Phil Garber", email: "phil@example.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Peter Gibbons", email: "pgibbons@in-itech.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Bill Lumbergh", email: "BLumbergh@in-itech.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Samir Nagheenanajar", email: "samir@in-itech.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Michael Bolton", email: "mbolton@in-itech.com", password: "password", 
				password_confirmation: "password")
	user.confirm!
	user = User.create!(name: "Milton Waddams", email: "milton@in-itech.com", password: "password", 
				password_confirmation: "password")
end