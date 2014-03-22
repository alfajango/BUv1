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
puts 'user: ' << user.name
User.create!(name: "Jane Williams", email: "jwilliams@example.com", password: "password", 
			password_confirmation: "password")
temp_user = User.find_by(name: "Jane Williams")
puts "temp_user.id: #{temp_user.id}"
User.create!(name: "Bill Jones", email: "bjones@example.com", password: "password", 
			password_confirmation: "password")
temp_user = User.find_by(name: "Bill Jones")
puts "temp_user.id: #{temp_user.id}"
User.create!(name: "Beth Hillman", email: "bhillman@example.com", password: "password", 
			password_confirmation: "password")
User.create!(name: "Trevor Carawell", email: "tcarawell@example.com", password: "password", 
			password_confirmation: "password")
# end


#--------------- Attributes ------------------------------
# def make_attributes
attrib = Attribute.all
attrib.delete_all

attribute_list = [
	[ "Polished presentation", "posattrib", 1 ],
	[ "Deflects credit", "posattrib", 2 ]
]

puts 'ATTRIBUTES'
attribute_list.each do |attribute_name, category, identifier|
  Attribute.create!(  attribute_name: attribute_name, 
                  category: category, identifier: identifier )
end
# end


#--------------- Feedbacks ------------------------------
# def make_feedbacks
feedback = Feedback.all
feedback.delete_all
attrib = Attribute.first # make this better at some point
some_users = User.all(limit: 6)
a_user = User.find_by(name: "Jane Williams")
fb = feedback.create!(from_id: user.id, rating_given: 1)
fb.save # need?
puts "fb.from_id: #{fb.from_id}"
puts "fb.rating_given: #{fb.rating_given}"
puts "fb.class: #{fb.class}"
fb.attribute = attrib # seems to be working now
puts "hi, mom"
puts "fb.attribute.attribute_name #{fb.attribute.attribute_name}"
puts "a_user.name #{a_user.name}"
fb.user = a_user   # a_user.feedback = fb didn't work.  Maybe need a inverse_of
puts "hi phil"
puts "a_user.feedbacks.class #{a_user.feedbacks.class}" # can't do .feedback  - must be plural ??
puts "a_user.feedbacks.first.class #{a_user.feedbacks.first.class}" # nilclass
puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # 0 

a_user.feedbacks << fb  # do these two lines do the same thing?  Which one is correct, if not?
puts "jay z"
puts "a_user.feedbacks.class #{a_user.feedbacks.class}" # can't do .feedback  - must be plural ??
puts "a_user.feedbacks.first.class #{a_user.feedbacks.first.class}" # feedback
puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # 1 


# a_user.feedbacks = fb  # doesn't work - undefined method 'compact'

############## THE FOLLOWING WORKS #######################
# adding the same exact fb to an user doesn't do anything:
a_user.feedbacks << fb
puts "what what"
puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # still just 1 

# adding a new feedback to a user does increase a_user.feedbacks.size:
fb2 = feedback.create!(from_id: user.id, rating_given: 1)
attrib = Attribute.find_by(attribute_name: "Deflects credit")
fb2.attribute = attrib
a_user.feedbacks << fb2
puts "a_user.feedbacks.size #{a_user.feedbacks.size}" # now it is 2

# how about if fb is now a different piece of fb? that seems to be OK
fb = feedback.create!(from_id: user.id, rating_given: 1)
fb.attribute = attrib

a_user.feedbacks << fb
puts " 3rd a_user.feedbacks.size #{a_user.feedbacks.size}" # now it is 3
##############  THE PROCEEDING WORKS #######################

#puts "a_user.feedbacks.methods - Object.methods #{a_user.feedbacks.methods - Object.methods}"
# puts "a_user.feedbacks.rating_given #{a_user.feedbacks.rating_given}"  # I need to figure out how to do this!
# puts "fb.attribute.attribute_name #{fb.attribute.attribute_name}"


feedback_list = [  # 10 votes, from 3 different people, chosen randomly
	[ rand(1..3), rand(1..10) ],
	[ rand(1..3), rand(1..10) ],	
	[ rand(1..3), rand(1..10) ],
	[ rand(1..3), rand(1..10) ],	
	[ rand(1..3), rand(1..10) ],
	[ rand(1..3), rand(1..10) ],	
	[ rand(1..3), rand(1..10) ],
	[ rand(1..3), rand(1..10) ],	
	[ rand(1..3), rand(1..10) ],
	[ rand(1..3), rand(1..10) ]
]
puts "feedback_list: #{feedback_list}"

fb = feedback.create!(from_id: user.id, rating_given: 1)



feedback_list.each do |from_id, rating_given| 
  users.each { |user| user.attrib.feedback.create!(from_id: from_id, rating_given: rating_given) } # no FB created!
end
user = User.find_by(name: "Jane Williams")
puts "user.name: #{user.name}"

# users don't have attributes:
# puts "user.attrib.feedback.from_id: #{user.attrib.feedback.from_id}" # fails on undefined method attrib for nilclass
puts "attrib.feedbacks: #{attrib.feedbacks}"
# puts "feedback.first.rating_given: #{feedback.first.rating_given}"

# do ratings in crunch_ratings


#--------------- Companies ------------------------------
companies = Company.all
companies.delete_all
Company.create!(domain: "example.com", name: "Example" )
Company.create!(domain: "acme.com", name: "Acme" )
Company.create!(domain: "apple.com", name: "Apple" )
puts "COMPANY: #{Company.first.name}"
# need to put people in those companies:


#--------------- Projects ------------------------------
proj = Project.all
proj.delete_all
company = Company.find_by(name: "Example") #Company.where(..) gives the string Company.  use find_by
puts "in projects, company.name: #{company.name}"
company.projects.create!(name: "Factory cost reduction")  # why projectS ???
project2 = company.projects.create!(name: "Acquire competitors")  # why projectS ???
puts "project2.company.name #{project2.company.name }"
company = Company.find_by(name: "Acme")
puts "in projects, 2nd project's company.name: #{project2.company.name}"
company.projects.create!(name: "Factory cost reduction")
company.projects.create!(name: "Put ExampleCo out of business")
puts "PROJECT: #{Project.first.name}"
puts "in projects, 2nd project's company.name is still: #{project2.company.name}"


# Get rid of projectattributes
# projatts = ProjectAttribute.all
# projatts.delete_all
# projatts.destroy

#--------------- ProjectFeedbacks ------------------------------
projfb = ProjectFeedback.all
projfb.delete_all
user = User.find_by(name: "Jane Williams")
puts "in ProjectFeedbacks, user.name: #{user.name}"
company = Company.find_by(name:"Example")
project = company.projects.find_by(name: "Factory cost reduction")  # which company - BE CAREFUL
# it will let you do project = project.find_by(name...) but it seems like it leave company ambiguous
puts "in ProjectFeedbacks, project.name: #{project.name}"
puts "in ProjectFeedbacks, project.company.name: #{project.company.name}"

user.project.project_ratings.create(attribute: "Execution")
puts "here 0"

pfb = ProjectFeedback.create()
puts "here 1"
#pfb.attribute = "Execution"
puts "here 2"
#firstfeedback = project.project_feedbacks.new #create()
puts "here 3"
#ProjectFeedback.create!(attribute: "Execution", from_id: user.id, rating_given: 8)
#puts "ProjectFeedback.first.rating_given #{ProjectFeedback.first.rating_given}"
#puts "project.project_feedback.attribute: #{project.project_feedback.attribute}"

# def make_feedbacks
#   users = User.all
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "5")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "6")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1001", rating_given: "8")
# end	

# project_attribute_list = [
#   [ 1, "Strategy" ],   # for now, leave out project_id because strategy and execution will be applied to all
#   [ 2, "Execution" ]
#   ]

# project_attribute_list.each do |id, project_attribute_name|
#   ProjectAttribute.create( identifier: id, project_attribute_name: project_attribute_name )
# end


 ### from BUv2 sample_data.rake:
#  namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     clear_db
#     make_users
#     # make_microposts
#     # make_relationships
#     make_companies
#     make_feedbacks
#     make_company_employees
#     make_projects
#     make_project_feedbacks
#   end
# end

# # not generated here:
# #   attributes and project_attributes are in seeds.rb
# #   ratings and project_ratings are created by rake db:crunch_ratings

# def clear_db
#   users = User.all
#   users.delete_all
#   companies = Company.all
#   companies.delete_all
#   feedbacks = Feedback.all
#   feedbacks.delete_all
#   co_emp = CompanyEmployee.all
#   co_emp.delete_all
#   projects = Project.all
#   projects.delete_all
#   proj_fb = ProjectFeedback.all
#   proj_fb.delete_all
# end


# def make_users
#   admin = User.create!(name: "Example User",
#                  email: "example@example.com",
#                  password: "foobar",
#                  password_confirmation: "foobar",
#                  admin: true)
#   99.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1}@example.com"
#     password  = "password"
#     User.create!(name: name,   
#                  email: email,
#                  password: password,
#                  password_confirmation: password)
#   end
# end

# # def make_microposts
# #   users = User.all(limit: 6)
# #   50.times do
# #     content = Faker::Lorem.sentence(5)
# #     users.each { |user| user.microposts.create!(content: content) }
# #   end
# # end

# # def make_relationships
# #   users = User.all
# #   user  = users.first
# #   followed_users = users[2..50]  # is this id 2, or 2nd in the table?
# #   followers      = users[3..40]
# #   followed_users.each { |followed| user.follow!(followed) }
# #   followers.each      { |follower| follower.follow!(user) }
# # end

# def make_companies
#   Company.create!(domain: "example.com", name: "Example" )
# end

# def make_feedbacks
#   users = User.all
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "5")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "6")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1")
#   Feedback.create!(from_id: users.first.id, to_id: users.last.id, attribute_identifier: "1001", rating_given: "8")
# end

# #not sure why I need to do this because I think make_users should call User.create, but it seems not to.
# def make_company_employees  # need your company (example.com) to already exist in  Company table
#   users = User.all 
#   companies=Company.all
#   users.each do |user|
#     domain = user.email.split("@").last
#     company_id = companies.find_by(domain: domain).id
#     CompanyEmployee.create!(company_id:(companies.find_by(domain: domain).id), user_id: user.id)
#   end
# end

# def make_projects
#   companies = Company.all
#   company_id = companies.first.id 
#   Project.create!(name: "Factory cost reduction", company_id: company_id)
#   Project.create!(name: "Competitor acquisition", company_id: company_id)
# end

# # project_attributes is in seeds.rb

# def make_project_feedbacks
#   users = User.all
#   projects = Project.all
#   ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "1", rating_given: "7")
#   ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "1", rating_given: "4")
#   ProjectFeedback.create!(from_id: users.first.id, to_project_id: projects.first.id, project_attribute_identifier: "2", rating_given: "5")
# end




