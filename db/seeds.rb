# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

users = User.all
users.delete_all

puts 'DEFAULT USERS'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name


attrib = Attribute.all
attrib.delete_all
# project_attrib = ProjectAttribute.all
# project_attrib.delete_all


attribute_list = [
	[ "Polished presentation", "posattrib", 1 ],
	[ "Deflects credit", "posattrib", 2 ]


]

puts 'ATTRIBUTES'
attribute_list.each do |attribute_name, category, identifier|
  Attribute.create!(  attribute_name: attribute_name, 
                  category: category, identifier: identifier )
end

# project_attribute_list = [
#   [ 1, "Strategy" ],   # for now, leave out project_id because strategy and execution will be applied to all
#   [ 2, "Execution" ]
#   ]

# project_attribute_list.each do |id, project_attribute_name|
#   ProjectAttribute.create( identifier: id, project_attribute_name: project_attribute_name )
# end
