# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

#--------------- Users ------------------------------
users = User.all
users.delete_all
# in case it creates companies & projects, also do this:
companies = Company.all
companies.delete_all
proj = Project.all
proj.delete_all

puts 'DEFAULT USERS'
User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, 
			:password => ENV['ADMIN_PASSWORD'].dup, 
			:password_confirmation => ENV['ADMIN_PASSWORD'].dup			
User.create!(name: "Jane Williams", email: "jwilliams@example.com", password: "password", 
			password_confirmation: "password")
#temp_user = User.find_by(name: "Jane Williams")
User.create!(name: "Bill Jones", email: "bjones@example.com", password: "password", 
			password_confirmation: "password")
#temp_user = User.find_by(name: "Bill Jones")
User.create!(name: "Beth Hillman", email: "bhillman@example.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Trevor Carawell", email: "tcarawell@example.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Phil Garber", email: "phil@example.com", password: "password", 
			password_confirmation: "password")

User.create!(name: "Peter Gibbons", email: "pgibbons@in-itech.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Bill Lumbergh", email: "BLumbergh@in-itech.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Samir Nagheenanajar", email: "samir@in-itech.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Michael Bolton", email: "mbolton@in-itech.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Milton Waddams", email: "milton@in-itech.com", password: "password", 
			password_confirmation: "password")
# end


#--------------- Attributes ------------------------------
# def make_attributes
attrib = Attribute.all
attrib.delete_all

# attributge_name, category, identifier
sentence_list = [
	[ "completing the project", "nicejob"],
	[ "meeting the deadline", "nicejob"],
	[ "the presentation", "nicejob"],
	[ "getting the sale", "nicejob"],
	[ "helping the team", "nicejob"],
	[ "closing the deal", "nicejob"],
	[ "building the customer relationship", "nicejob"],
	[ "deserves a raise", "nicejob"],
	[ "deserves a promotion", "nicejob"],
	[ "deserves a bonus", "nicejob"],
	[ "deserves more recognition", "nicejob"],
	
	[ "completing the project", "greatat"],
	[ "high quality work", "greatat"],
	[ "getting things done", "greatat"],
	[ "working efficiently", "greatat"],
	[ "working independently", "greatat"],
	[ "honesty", "greatat"],
	[ "confidence", "greatat"],
	[ "passion", "greatat"],
	[ "being a team player", "greatat"],
	[ "leadership", "greatat"],
	[ "management", "greatat"],

	[ "for the help", "thanks"],
	[ "for the information", "thanks"],
	[ "for the contact", "thanks"],
	[ "for the time", "thanks"],

	[ "communication", "workon"],
	[ "job knowledge", "workon"],
	[ "work output", "workon"],
	[ "work ethic", "workon"],
	[ "presentation skills", "workon"],
	[ "attitude", "workon"],
	[ "building rapport", "workon"],
	[ "building credibility", "workon"],
	[ "finishing projects", "workon"],
	[ "getting training", "workon"],
	[ "giving credit where due", "workon"],
	[ "bringing in more business", "workon"],
	[ "accuracy", "workon"],
	[ "avoiding mistakes", "workon"],
	[ "staying on task", "workon"],

	[ "poor job knowledge", "alert"],
	[ "poor leadership", "alert"],
	[ "poor people skills", "alert"],
	[ "poor management", "alert"],
	[ "poor customer skills", "alert"],
	[ "doesn't get things done", "alert"],
	[ "not in the right role", "alert"],
	[ "in over his/her head", "alert"],
	[ "wrong fit for the company", "alert"],
	[ "difficult to work for", "alert"]

]	

puts 'ATTRIBUTES'
sentence_list.each do |attribute_name, category, identifier|
  Attribute.create!(  attribute_name: attribute_name, 
#                  category: category, identifier: identifier )
                 category: category)
end
# end


#--------------- Feedbacks ------------------------------
# def make_feedbacks
feedback = Feedback.all
feedback.delete_all



feedback_list = [ # from_email, attribute object, to_user object
	["tcarawell@example.com", Attribute.find_by(attribute_name: "for the time"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "giving credit where due"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "leadership"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "meeting the deadline"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "helping the team"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a bonus"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Bill Jones") ],		 
	["tcarawell@example.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Bill Jones") ],		
	["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "staying on task"), User.find_by(name: "Bill Jones") ],		 
	["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "passion"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "passion"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Phil Garber") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Phil Garber") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Phil Garber") ],
	["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Beth Hillman") ],

	["milton@in-itech.com", Attribute.find_by(attribute_name: "difficult to work for"), User.find_by(name: "Bill Lumbergh") ],
	["milton@in-itech.com", Attribute.find_by(attribute_name: "wrong fit for the company"), User.find_by(name: "Peter Gibbons") ],
	["milton@in-itech.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Samir Nagheenanajar") ],
	["milton@in-itech.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Michael Bolton") ],
	["milton@in-itech.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Bill Lumbergh") ],
	["pgibbons@in-itech.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Milton Waddams") ]		
    ]

feedback_list.each do | from_email, attrib_obj, to_user_obj | 

  #fb = feedback.create!(from_id: from_id, rating_given: 1) 
  #  runs because when I deleted all, I did feedback = Feedback.all, then feedback.delete_all
  from_id = User.find_by(email: from_email).id
  fb = Feedback.create!(from_id: from_id, rating_given: 1)  
  #puts "3"
  fb.attribute = attrib_obj
  # puts "fb.attribute.attribute_name: #{fb.attribute.attribute_name} "
  to_user_obj.feedbacks << fb
  #puts "5"
end
puts "FEEDBACKS"

# create ratings in crunch_ratings if I want to do those


#--------------- Companies ------------------------------
# # shouldn't need this since companies should be set up when user created.  But, they're not being createed  

# companies = Company.all
# companies.delete_all
Company.create!(domain: "example.com", name: "Example" )
Company.create!(domain: "acme.com", name: "Acme" )
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

#--------------- Projects ------------------------------
# delete all up top.
#proj = Project.all
#proj.delete_all
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


#--------------- Pattributes ------------------------------
# def make_attributes
pattrib = Pattribute.all
pattrib.delete_all

# name, category, identifier
# just do name - and so it seems like the syntax is no brackets

pattribute_list = [
	"is important for the company" ,
	"is important for our customers",
	"is critical for the company",
	"is critical for our customers",
	"is unnecessary for the company",
	"is unnecessary for our customers",
	"is going well",
	"is going great",
	"is doing poorly",
	"could be doing better",
	"needs to be prioritized",
	"needs to be de-priorized",
	"needs to be rescoped",
	"needs to be cancelled",
	"needs to show progress",
	"needs to show market need",
	"needs to pivot",
	"needs more funding",
	"needs more resources",
	"needs more time",
	"needs more visiblility",
	"needs more support from management",
	"needs less funding",
	"needs a fresh start",
	"needs different resources",
	"needs different leadership",
	"needs a different team",
	"needs additional resources",
	"needs additional resources",
	"needs additional team"
]


pattribute_list.each do | name |
  Pattribute.create!(  name: name )
end
puts 'PATTRIBUTES'


#--------------- Pfeedbacks ------------------------------
pfb = Pfeedback.all
#puts "pfb.size: #{pfb.size}"
pfb.delete_all

pfeedback_list = [ # from_email, pattribute object, to_project object
	["tcarawell@example.com", Pattribute.find_by(name: "is important for the company"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs to pivot"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs additional team"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs more funding"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Acquire competitors") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs different leadership"), Project.find_by(name: "Acquire competitors") ],

	["tcarawell@example.com", Pattribute.find_by(name: "needs more time"), Project.find_by(name: "Factory cost reduction") ],
	["tcarawell@example.com", Pattribute.find_by(name: "is important for the company"), Project.find_by(name: "Factory cost reduction") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs different resources"), Project.find_by(name: "Factory cost reduction") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Factory cost reduction") ],
	["tcarawell@example.com", Pattribute.find_by(name: "is going great"), Project.find_by(name: "Factory cost reduction") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs additional team"), Project.find_by(name: "Factory cost reduction") ],

	["tcarawell@example.com", Pattribute.find_by(name: "needs different resources"), Project.find_by(name: "Refresh website") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Refresh website") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs more time"), Project.find_by(name: "Refresh website") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Refresh website") ],
	["tcarawell@example.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "Refresh website") ],

	["milton@in-itech.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Think: Is this good for the company?") ],
	["milton@in-itech.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Office Supply cost reduction") ],
	["milton@in-itech.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "New printer") ]
    ]

pfeedback_list.each do | from_email, pattrib_obj, to_proj_obj | 

  #fb = feedback.create!(from_id: from_id, rating_given: 1) 
  #  runs because when I deleted all, I did feedback = Feedback.all, then feedback.delete_all
  from_id = User.find_by(email: from_email).id
  pfb = Pfeedback.create!(from_id: from_id, rating_given: 1)  
  #puts "3"
  pfb.pattribute = pattrib_obj
  # puts "fb.attribute.attribute_name: #{fb.attribute.attribute_name} "
  to_proj_obj.pfeedbacks << pfb
  #puts "5"
end
puts "PFEEDBACKS"


#--------------- Ideas ------------------------------

ideas = Idea.all
ideas.delete_all

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

#--------------- Jobs ------------------------------
jobs = Job.all
jobs.delete_all

author= User.find_by(name: "Beth Hillman")
subject=User.find_by(name: "Trevor Carawell")
job_holder=User.find_by(name: "Jane Williams")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

subject=User.find_by(name: "Jane Williams")
job_holder=User.find_by(name: "Trevor Carawell")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

subject=User.find_by(name: "Bill Jones")
job_holder=User.find_by(name: "Phil Garber")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

author= User.find_by(name: "Phil Garber")
subject=User.find_by(name: "Beth Hillman")
job_holder=User.find_by(name: "Trevor Carawell")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

author= User.find_by(name: "Phil Garber")
subject=User.find_by(name: "Beth Hillman")
job_holder=User.find_by(name: "Jane Williams")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

# same vote from someone else
author= User.find_by(name: "Bill Jones")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

author= User.find_by(name: "Milton Waddams")
subject=User.find_by(name: "Peter Gibbons")
job_holder=User.find_by(name: "Bill Lumbergh")
job=Job.create!(created: Time.now,
				author: author,
				subject: subject,
				job_holder: job_holder)

puts "JOBS"