class PfeedbacksController < ApplicationController
	puts "in pfeedbacks_controller"
  def create  # where is this called from?
    puts "in pfeedbacks_controller create"
    @pfb = Pfeedback.new(pfeedback_params)   
    puts "pfeedback_params: #{pfeedback_params}"
    #@companies = Company.all
  end

  def new
    puts "in PfeedbacksController new action"
    @pfeedback = Pfeedback.new
  	# @relationship = Relationship.new
  end

  def create # this called from users/show.html.erb?? when clicking on the temporary button
    puts "in pfeedbacks_controller create action "

    #method to do something without going to another page: http://stackoverflow.com/questions/2139996/ruby-on-rails-redirect-toback
    session[:return_to] ||= request.referer
    Pfeedback.create(params[:pfeedback])
    redirect_to session.delete(:return_to)

  end


  def pattribute_selected
    put "in pfeedbacks_controller pattribute_selected"
    #@attribute=Attribute.all
    puts "params: #{params}"
    pattrib_obj = params[:pattribute] # ??
    #to_user = params[:user] # fix  ????
    to_project = Project.find(params[:id])
    pfb = Pfeedback.create!(from_id: from_id, rating_given: 1)  
    pfb.attribute = pattrib_obj
    to_project.pfeedbacks << pfb
  end


  def complete  # needed?  if so, finish converting to projects
    puts "in pfeedbacks_controller complete"

    @pattribute=Pattribute.all
    @user = User.find(params[:id])
    params[:attribute_checkbox].each do |check|

       attribute_identifier = check

      #t = Feedback.find_by_id(attribute_id) # don't need this since I'm always creating new

      Feedback.create(from_id: current_user.id, to_id: @user.id, 
                  attribute_identifier: attribute_identifier);

     end
    flash[:success] = "Feedback saved.  Feedback will show up after midnight EST tonight"
    redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
  end


	# def pslider_complete
	# 	puts "in pslider_complete"
	# 	#puts "params[:id]: #{params[:id]}"
	# 	#puts "params: #{params}"
	# 	#puts "comScore: #{params[:comScore]}"

	# 	#@attribute=Attribute.all
	# 	#@user = User.find(params[:id])
	# 	puts "params: #{params}"
	# 	project = Project.find_by(id: params[:id])
	# 	puts "project.name: #{project.name}"
	# 	if params[:executionScore].to_i > 0
	# 	  puts "in pslider_complete if executionValue"
	# 	  pfb = Pfeedback.create(attribute: "Execution", from_id: current_user.id,  
	# 	                    rating_given: params[:ExecutionScore]);
	# 	  project.pfeedbacks << pfb
	# 	end
	# 	if params[:strategyScore].to_i > 0
	# 	  pfb = Pfeedback.create(attribute: "Strategy", from_id: current_user.id,  
	# 	                    rating_given: params[:StratScore]);
	# 	  project.pfeedbacks << pfb
	# 	end


	# 	flash[:success] = "Thanks for the feedback!"
	# 	redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
	# end

end
