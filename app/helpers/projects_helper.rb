module ProjectsHelper

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

    # this one works, but it sorts by project creation date rather than feedback date
    # puts "project_helper projects_for_homepage current_user.name: #{current_user.name}"
    # puts "current_user.company.name: #{current_user.company.name}"
    # count = 1  
    # company_projects = current_user.company.projects
    # company_projects.sort_by { |a| a[:created] }

    # company_projects.each do |proj|  # .reverse_each?
    #   if count > 3
    #   return
    #   end  

    #   unless @show_projects.include?(proj)
    #     @show_projects.push(proj)
    #   count += 1
    #   end
    # end

    count = 1  
    project_ids = Project.where(company: current_user.company).only(:_id).map(&:_id)
    puts "project_ids: #{project_ids}"
    puts "project_ids.count: #{project_ids.count}"
    company_fb = Pfeedback.where(:project_id.in => project_ids)    # :project.in ->project_ids gives same result
    # puts "company_fb.count: #{company_fb.count}"
    
    puts "current_user.company.id: #{current_user.company.id}"

    company_fb.sort_by { |a| a[:created] }
    company_fb.each do |pfb|
      puts "pfb.class: #{pfb.class} pfb.project.class: #{pfb.project.class}, pfb.project.created: #{pfb.project.created}, pfb.from_id:#{pfb.from_id}"
      puts "pfb.project.name.class: #{pfb.project.name.class}"
      if count >3
        return
      end
      unless @show_projects.include?(pfb.project) 
        @show_projects.push(pfb.project)
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


  def set_project(params)
    project = Project.find_by(id: params[:id])  # return project is implied
  end

  def set_project_btn_type(category)
  	case category
  	when "positive"
  	  btnclass = "btn btn-success dropdown-toggle"
  	  text = "Positive"
  	when "needs"
  	  btnclass = "btn btn-primary dropdown-toggle"
  	  text = "Needs"
  	when "negative"
  	  btnclass = "btn btn-danger dropdown-toggle"
  	  text = "Negative"
  	end
  	#puts "btnclass: #{btnclass}"
  	#puts "text: #{text}"
  	return btnclass, text
  end

end
