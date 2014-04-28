module ProjectHelper



  def histogram_project_data(target_project_id, target_project_attribute)
    @proj_hist_data = { "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0, "9" => 0, "10" => 0}
	@proj_hist_has_data = 0 
	relevant_data = Pfeedback.where(to_project_id: target_project_id, 
  							project_attribute_identifier: target_project_attribute)
    relevant_data.each do |feedback|
  	  @proj_hist_data[ feedback.rating_given ] = @proj_hist_data[ feedback.rating_given ].to_i + 1
  	  @proj_hist_has_data = 1  # we have put some data in
  	end
  end


  def projects_for_homepage()  # put up to 3 project_id's in @show_project_id
	@show_projects = Array.new

	puts "project_helper projects_for_homepage current_user.name: #{current_user.name}"
	puts "current_user.company.name: #{current_user.company.name}"

	company_projects = current_user.company.projects

	count = 1  
	company_projects.reverse_each do |proj|  # traverse starting with newest (last)
	  if count > 3
		return
	  end	 

	  unless @show_projects.include?(proj)
	    @show_projects.push(proj)
		count += 1
	  end
	end

  end


  def graph_project_data(target_project_id) # gathers & prepares data in @all_rating_data for kickchart graphing
	  # this is not complete yet
	
	  print "in projectsHelper graph_project_data "

	  # format data into an array of arrays for chartkick 
	  @all_rating_data = Array.new
	  @project_ratings = ProjectRating.where(project_id: target_project_id )
	  @attributes=Attribute.all
	  my_ratings = Array.new
	  @ratings.each do |rating|
	  	# TODO: I could use some error checking here because if bad data gets into ratings, can't render home page
	  	# example: if there is a row in the ratings table with an attribute_identifier that's no longer in the 
	  	# attributes table
	     my_ratings.push(rating)  
	     puts "rating:.project_attribute_identifier #{rating.project_attribute_identifier}"
	  end

	  #users_good_ratings.sort! { |a,b| b.current_rating <=> a.current_rating } # sort by current rating

	  my_ratings.each do |rating|
	  	this_attribute_name = @attributes.find_by(identifier: rating.attribute_identifier).attribute_name
	    @all_rating_data.push([this_attribute_name, rating.current_rating])
	  end
  end

end

