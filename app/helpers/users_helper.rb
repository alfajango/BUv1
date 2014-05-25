module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = {size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def set_user(params)
  	#puts "in users_helper set_user"
  	#puts "params: #{params}"
  	user = User.find_by(id: params[:id])  # return user is implied
  	#puts "user.name: #{user.name}"
  	return user
  end

  def set_btn_type(category)
  	case category
  	when "nicejob"
  	  btnclass = "btn btn-purple dropdown-toggle"
  	  text = "nice job"
  	when "greatat"
  	  btnclass = "btn btn-primary dropdown-toggle"
  	  text = "is great at"
  	when "thanks"
  	  btnclass = "btn btn-success dropdown-toggle"
  	  text = "thanks"
  	when "workon"
  	  btnclass = "btn btn-warning dropdown-toggle"
  	  text = "work on"
  	when "alert"
  	  btnclass = "btn btn-danger dropdown-toggle"
  	  text = "alert"
  	end
  	#puts "btnclass: #{btnclass}"
  	#puts "text: #{text}"
  	return btnclass, text
  end



  def users_for_homepage()
	# @show_users = Array.new
	# co = current_user.company
	# puts "co.name: #{co.name}"

	# company_users = co.users
	# count = 1

	# #company_fb = []  # all good feedback for this company's employees
	# 	# allfb = Feedback.all
	# # user_ids = User.where(username: 'erebus').only(:_id).map(&:_id)
	# # articles = Article.where(:user_id.in => user_ids)
	

	# # http://stackoverflow.com/questions/9991217/rails-mongoid-criteria-find-by-association
	# user_ids = User.where(company: co).only(:_id).map(&:_id)
	# # user_ids.each do |usrid|
	# # 	puts "usrid: #{usrid}"
	# # end


	# #puts "user_ids.count: #{user_ids.count}"
	# #company_fb = Feedback.where(:user_id.in => user_ids)  # is :user_id right??
	# company_fb = Feedback.where(:user_id.in => user_ids)
	
	# # company_fb.each do |fb|
	# # 	puts "fb.attribute.category: #{fb.attribute.category}, fb.user.email: #{fb.user.email}, fb.class: #{fb.class}"
	# # end
	
	# #puts "company_fb.count: #{company_fb.count}"
	# #puts "company_fb.first.attribute.category: #{company_fb.first.attribute.category}"
	# company_fb.sort_by { |a| a[:created] }
	# # puts "company_fb.size: #{company_fb.size}"
	# # puts "company_fb.first.user.name: #{company_fb.first.user.name}"
	# # puts "company_fb.first.rating_given: #{company_fb.first.rating_given}"
	# company_fb.each do |fb|
	# 	if count >3
	# 	  return
	# 	end
	# 	unless @show_users.include?(fb.user)
	# 	  unless fb.attribute.category=='workon' || fb.attribute.category=='alert'	
	# 	    @show_users.push(fb.user)
	# 	    # puts "fb.user.id: #{fb.user.id}"
	# 	    # puts "fb.user.name: #{fb.user.name}"
	# 	    # # puts "fb.user.methods: #{fb.user.methods - Class.methods}"
	# 	    # puts "fb.user.class: #{fb.user.class}"
	# 	    # puts "@show_users.last.class: #{@show_users.last.class}"
	# 	    # puts "@show_users.last.name: #{@show_users.last.name}"
	# 	    count += 1
	# 	  end
	# 	end
	# 	#puts "@show_users.first.class: #{@show_users.first.class}"
	# end

	#company_fb = Feedback.where(company: co)


####### this method works, but is like O(n) or O(n^2) ######### 
# using this non-scalable method lets the homepage names render correctly in both colleagues & ideas
	@show_users = Array.new
	co = current_user.company
	puts "co.name: #{co.name}"

	company_users = co.users
	count = 1	
	allfb = Feedback.all
	company_fb = []  # all good feedback for this company's employees

	allfb.each do |fb|

	  if fb.user  # sometimes it's null?
		  if (company_users.include? fb.user)
		  # this works, sort of: # and (fb.attribute.category == ("nicejob" || "greatat" || "thanks")))
		  	company_fb << fb
		  end
	  end
	end
	company_fb.sort_by { |a| a[:created] }

	company_fb.each do |fb|
		if count >3
		  return
		end
		unless @show_users.include?(fb.user)
		  @show_users.push(fb.user)
		  count += 1
		end
	end
	#########################################

	# #this isn't getting the most recently rated users.  just most recently created.  
	# company_users.reverse_each do |user|   # traverse newest (last) first
	#   if count > 3
	# 	return
	#   end	 
	#   unless (@show_users.include?(user) or user.feedbacks.size.to_i < 1)
	#     @show_users.push(user)
	# 	count += 1
	#   end
	# end



  end

  def detailed_feedback()
  	@myfb = current_user.feedbacks
  end

  
	# def graph_all_data(target_user_id)
	#   puts "in graph_all_data "

	#   # format data into an array of arrays for chartkick - get top 5 positive attributes and top 1 negative attribute
	#   @chartkick_data = Array.new
	#   @ratings = Rating.where(user_id: target_user_id)
	#   @attributes=Attribute.all
	#   users_good_ratings = Array.new
	#   users_bad_ratings = Array.new
	#   @ratings.each do |rating|
	#   	# TODO: I could use some error checking here because if bad data gets into ratings, can't render home page
	#   	# example: if there is a row in the ratings table with an attribute_identifier that's no longer in the 
	#   	# attributes table
	#       if @attributes.find_by(identifier: rating.attribute_identifier).good == "true"  # if it's a good rating
	#       	users_good_ratings.push(rating)  
	#       elsif @attributes.find_by(identifier: rating.attribute_identifier).good == "false" # rating is bad
	#       	users_bad_ratings.push(rating)
	#       end
	#   end

	#   users_good_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating
	#   users_bad_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating

	#   users_good_ratings.each do |rating|
	#   	  this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	#       @chartkick_data.push([this_attribute_name, rating.current_rating])
	#   end

	#   users_bad_ratings.each do |rating|  # now find the highest rated negative attrib and add to @show_attributes
	#   	  this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	#       @chartkick_data.push([this_attribute_name, -1 * rating.current_rating])
	#   end
	# end


	# # data for full detail on 5 rating categories
	# def graph_all_rating_data(target_user_id)  
	#   puts "in graph_all_rating_data "

	#   # format data into an array of arrays for chartkick - get top 5 positive attributes and top 1 negative attribute
	#   @all_rating_data = Array.new
	#   @ratings = Rating.where("attribute_identifier > ? AND user_id = ?", 999, target_user_id )
	#   @attributes=Attribute.all
	#   puts @attributes.last.attribute_name
	#   my_ratings = Array.new
	#   puts "here23"
	#   @ratings.each do |rating|
	#   	# TODO: I could use some error checking here because if bad data gets into ratings, can't render home page
	#   	# example: if there is a row in the ratings table with an attribute_identifier that's no longer in the 
	#   	# attributes table
	#      my_ratings.push(rating)  
	#      puts "rating:.attribute_identifier #{rating.attribute_identifier}"
	#   end

	#   #users_good_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating

	#   my_ratings.each do |rating|
	#   	this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	#     @all_rating_data.push([this_attribute_name, rating.current_rating])
	#   end
	# end

end
