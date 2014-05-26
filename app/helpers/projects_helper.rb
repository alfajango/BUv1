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
    # This one also has about the same number of queries and it gives /projects/53834ce3946cf1cf30000062
    # for the name of the project on the homepage
    # project_ids = Project.where(company: current_user.company).only(:_id).map(&:_id)
    # puts "project_ids: #{project_ids}"
    # puts "project_ids.count: #{project_ids.count}"
    # project_id = project_ids.first
    # puts "project_id: #{project_id}"
    # company_fb = Pfeedback.where(:project_id.in => project_ids)    # :project.in ->project_ids gives same result
    # company_fb = Pfeedback.where(:project_id === "5382a777946cf1c00a000062")    # :project.in ->project_ids gives same result
    #company_fb = Pfeedback.find_by(project_id: "5382a777946cf1c00a000062")
    #puts "company_fb.project.id: #{company_fb.project.id}"
    #company_fb = Pfeedback.all
    # puts "company_fb.count: #{company_fb.count}"
    
    # puts "current_user.company.id: #{current_user.company.id}"

    # this one also works, and supposedly sorts by recentness of fb 
    # This has O(n) queries, just like the original working method
    count = 1  
    company_fb=[]
    company_projects = current_user.company.projects
    #puts "company_projects.count: #{company_projects.count}"

    company_projects.each do |proj|
      proj.pfeedbacks.each do |pfb|
        company_fb << pfb
     #   puts "pfb.pattribute.name: #{pfb.pattribute.name}, pfb.created: #{pfb.created}"
      end
    end
    #puts "company_fb.count: #{company_fb.count}, company_fb.class: #{company_fb.class}"

    company_fb_sorted = company_fb.sort_by { |a| a[:created] }.reverse
    company_fb_sorted.each do |pfb|
      # puts "pfb.class: #{pfb.class} pfb.project.class: #{pfb.project.class}, pfb.project.created: #{pfb.project.created}, pfb.from_id:#{pfb.from_id}"
      # puts "pfb.project.name: #{pfb.project.name}"
      #puts "pfb.pattribute.name: #{pfb.pattribute.name}, pfb.created: #{pfb.created}"
      if count >3
        return
      end
      unless @show_projects.include?(pfb.project) 
        @show_projects.push(pfb.project)
        count += 1
      end
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
