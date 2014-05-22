module ProjectsHelper

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
