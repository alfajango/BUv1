# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# make_users
# make_attributes
# make feedbacks

# def make_users


#--------------- Users ------------------------------
users = User.all
users.delete_all

puts 'DEFAULT USERS'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, 
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
# end


#--------------- Attributes ------------------------------
# def make_attributes
attrib = Attribute.all
attrib.delete_all

# attributge_name, category, identifier
sentence_list = [
	[ "is the best at technical knowledge", "posattrib", 1 ],
	[ "is the best at communication", "posattrib", 2 ],
	[ "is the best at leadership", "posattrib", 3 ],
	[ "is the best at hiring", "posattrib", 4 ],
	[ "is the best at management", "posattrib", 5 ],
	[ "has the most job knowledge", "posattrib", 6 ],
	[ "has the most job experience", "posattrib", 7 ],
	[ "has achieved the most", "posattrib", 8 ],
	[ "is the best at self marketing", "posattrib", 9 ],
	[ "is the best at presenting", "posattrib", 10 ],

	[ "is great at technical knowledge", "posattrib", 11 ],
	[ "is great at communication", "posattrib", 12 ],
	[ "is great at leadership", "posattrib", 13 ],
	[ "is great at hiring", "posattrib", 14 ],
	[ "is great at management", "posattrib", 15 ],
	[ "has great job knowledge", "posattrib", 16 ],
	[ "has great job experience", "posattrib", 17 ],
	[ "has great achievements", "posattrib", 18 ],
	[ "is great at self marketing", "posattrib", 19 ],
	[ "is great at presenting", "posattrib", 20 ],

	[ "is competent at technical knowledge", "constructive", 21 ],
	[ "is competent at communication", "constructive", 22 ],
	[ "is competent at leadership", "constructive", 23 ],
	[ "is competent at hiring", "constructive", 24 ],
	[ "is competent at management", "constructive", 25 ],
	[ "has some job knowledge", "constructive", 26 ],
	[ "has some job experience", "constructive", 27 ],
	[ "has some achievements", "constructive", 28 ],
	[ "is competent at self marketing", "constructive", 29 ],
	[ "is competent at presenting", "constructive", 30 ],

	[ "is improving at technical knowledge", "constructive", 31 ],
	[ "is improving at communication", "constructive", 32 ],
	[ "is improving at leadership", "constructive", 33 ],
	[ "is improving at hiring", "constructive", 34 ],
	[ "is improving at management", "constructive", 35 ],
	[ "is improving job knowledge", "constructive", 36 ],
	[ "is improving job experience", "constructive", 37 ],
	[ "is improving achievements", "constructive", 38 ],
	[ "is improving at self marketing", "constructive", 39 ],
	[ "is improving at presenting", "constructive", 40 ],

	[ "is poor at technical knowledge", "alert", 41 ],
	[ "is poor at communication", "alert", 42 ],
	[ "is poor at leadership", "alert", 43 ],
	[ "is poor at hiring", "alert", 44 ],
	[ "is poor at management", "alert", 45 ],
	[ "has poor job knowledge", "alert", 46 ],
	[ "has poor job experience", "alert", 47 ],
	[ "has poor achievements", "alert", 348 ],
	[ "is poor at self marketing", "alert", 49 ],
	[ "is poor at presenting", "alert", 50 ],


]

puts 'ATTRIBUTES'
sentence_list.each do |attribute_name, category, identifier|
  Attribute.create!(  attribute_name: attribute_name, 
                  category: category, identifier: identifier )
end
# end


#--------------- Feedbacks ------------------------------
# def make_feedbacks
feedback = Feedback.all
feedback.delete_all

############## THE FOLLOWING WORKS #######################
# attrib = Attribute.first # make this better at some point
# some_users = User.all(limit: 6)
# a_user = User.find_by(name: "Jane Williams")
# fb = feedback.create!(from_id: user.id, rating_given: 1)
# #fb.save # need?
# puts "fb.from_id: #{fb.from_id}"
# puts "fb.rating_given: #{fb.rating_given}"
# puts "fb.class: #{fb.class}"
# fb.attribute = attrib # seems to be working now
# puts "hi, mom"
# puts "fb.attribute.attribute_name #{fb.attribute.attribute_name}"
# puts "a_user.name #{a_user.name}"
# fb.user = a_user   # a_user.feedback = fb didn't work.  need to say a_user.feedbacks << fb
# puts "hi phil"
# puts "a_user.feedbacks.class #{a_user.feedbacks.class}" # can't do .feedback  - must be plural ??
# puts "a_user.feedbacks.first.class #{a_user.feedbacks.first.class}" # nilclass
# puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # 0 

# a_user.feedbacks << fb  # do these two lines do the same thing?  Which one is correct, if not?
# puts "jay z"
# puts "a_user.feedbacks.class #{a_user.feedbacks.class}" # can't do .feedback  - must be plural ??
# puts "a_user.feedbacks.first.class #{a_user.feedbacks.first.class}" # feedback
# puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # 1 


# # adding the same exact fb to an user doesn't do anything:
# a_user.feedbacks << fb
# puts "what what"
# puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # still just 1 

# # adding a new feedback to a user does increase a_user.feedbacks.size:
# fb2 = feedback.create!(from_id: user.id, rating_given: 1)
# attrib = Attribute.find_by(attribute_name: "Deflects credit")
# fb2.attribute = attrib
# a_user.feedbacks << fb2
# puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # now it is 2

# # how about if fb is now a different piece of fb? that seems to be OK
# fb = feedback.create!(from_id: user.id, rating_given: 1)
# fb.attribute = attrib

# a_user.feedbacks << fb
# puts " 3rd a_user.feedbacks.size #{a_user.feedbacks.size}" # now it is 3

# # now, accessing the data
# fbs = a_user.feedbacks
# atts = fbs[0].attribute
# att_name = atts.attribute_name
# puts "att_name: #{att_name}"
# puts "a_user.feedbacks[0].attribute.attribute_name: #{a_user.feedbacks[0].attribute.attribute_name}"
##############  THE PROCEEDING WORKS #######################



feedback_list = [ # from_email, attribute object, to_user object
	["tcarawell@example.com", Attribute.find_by(identifier: 1), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 2), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 3), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 4), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 1), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 2), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 3), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 4), User.find_by(name: "Bill Jones") ],		 
	["tcarawell@example.com", Attribute.find_by(identifier: 5), User.find_by(name: "Bill Jones") ],		
	["tcarawell@example.com", Attribute.find_by(identifier: 3), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 4), User.find_by(name: "Bill Jones") ],		 
	["tcarawell@example.com", Attribute.find_by(identifier: 5), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 1), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 2), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 3), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 4), User.find_by(name: "Jane Williams") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 1), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 2), User.find_by(name: "Bill Jones") ],
	["tcarawell@example.com", Attribute.find_by(identifier: 3), User.find_by(name: "Bill Jones") ]
    ]
puts "1"

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


# create ratings in crunch_ratings if I want to do those


#--------------- Companies ------------------------------
companies = Company.all
companies.delete_all
Company.create!(domain: "example.com", name: "Example" )
Company.create!(domain: "acme.com", name: "Acme" )
Company.create!(domain: "apple.com", name: "Apple" )
puts "COMPANY: #{Company.first.name}"
# need to put people in those companies:
users = User.all
users.each do | user |
  domain = user.email.split("@").last
  co = Company.find_by(domain: domain)
  # user.company = co   # this line isn't getting it done #####################
  co.users << user  # THIS WORKS AND PREVIOUS LINE DOESNT!!!
end





#--------------- Projects ------------------------------
proj = Project.all
proj.delete_all

proj = Project.create!(name: "Acquire competitors")
company = Company.find_by(name: "Example") 
company.projects << proj
proj = Project.create!(name: "Factory cost reduction")
company.projects << proj
proj = Project.create!(name: "Refresh website")
company.projects << proj

company = Company.find_by(name: "Acme")
company.projects << proj  # Acme will also refresh their website
proj = Project.create!(name: "acquire ExxonMobil")
company.projects << proj

company = Company.find_by(name: "Apple")
proj = Project.create!(name: "bigger iPhone")
company.projects << proj

puts "company.projects[0].name: #{company.projects[0].name}"  # projects is an array

# OLD CODE:
# puts "in projects, company.name: #{company.name}"
# company.projects.create!(name: "Factory cost reduction")  # why projectS ???
# project2 = company.projects.create!(name: "Acquire competitors")  # why projectS ???
# puts "project2.company.name #{project2.company.name }"
# company = Company.find_by(name: "Acme")
# puts "in projects, 2nd project's company.name: #{project2.company.name}"
# company.projects.create!(name: "Factory cost reduction")
# company.projects.create!(name: "Put ExampleCo out of business")
# puts "PROJECT: #{Project.first.name}"
# puts "in projects, 2nd project's company.name is still: #{project2.company.name}"



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
puts "pfb.size: #{pfb.size}"
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
	["tcarawell@example.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "Refresh website") ]
    ]
puts "before pfeedback_list.each"

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
puts "PFeedbacks"



# #--------------- Pfeedbacks ------------------------------
# pfb = Pfeedback.all
# puts "pfb.size: #{pfb.size}"
# pfb.delete_all

# pfeedback_list = [ # from_id, attribute, rating_given, project object
# 	[1, "Execution", 8, Project.find_by(name: "Acquire competitors") ],
# 	[1, "Strategy", 7, Project.find_by(name: "Acquire competitors") ],
# 	[1, "Execution", 6, Project.find_by(name: "Factory cost reduction") ],
# 	[1, "Strategy", 5, Project.find_by(name: "Factory cost reduction") ],
# 	[1, "Execution", 10, Project.find_by(name: "Refresh website") ],
# 	[1, "Strategy", 9, Project.find_by(name: "Refresh website") ],
# 	[2, "Execution", 10, Project.find_by(name: "Acquire competitors") ],
# 	[2, "Strategy", 9, Project.find_by(name: "Acquire competitors") ],
# 	[2, "Execution", 8, Project.find_by(name: "Factory cost reduction") ],
# 	[2, "Strategy", 7, Project.find_by(name: "Factory cost reduction") ],
# 	[2, "Execution", 6, Project.find_by(name: "Refresh website") ],
# 	[2, "Strategy", 5, Project.find_by(name: "Refresh website") ],
# 	[3, "Execution", 1, Project.find_by(name: "Acquire competitors") ],
# 	[3, "Strategy", 2, Project.find_by(name: "Acquire competitors") ],
# 	[3, "Execution", 3, Project.find_by(name: "Factory cost reduction") ],
# 	[3, "Strategy", 4, Project.find_by(name: "Factory cost reduction") ],
# 	[3, "Execution", 5, Project.find_by(name: "Refresh website") ],
# 	[3, "Strategy", 6, Project.find_by(name: "Refresh website") ]
#     ]


# pfeedback_list.each do | from_id, attribute, rating_given, project | 
#   pfb = Pfeedback.create!(from_id: from_id, attribute: attribute, rating_given: rating_given)
#   #projfb = pfb.create!(from_id: from_id, attribute: attribute, rating_given: rating_given)
#   # try pfb = project_feedback.create 
#   project.pfeedbacks << pfb
# end
# puts "PFeedbacks"
