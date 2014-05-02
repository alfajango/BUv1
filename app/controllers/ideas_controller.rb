class IdeasController < ApplicationController

  def index
  	#@ideas = current_user.company.ideas.all
  	first_idea = Idea.first
  	puts "current_user.company.ideas.first.thread.nil?: #{current_user.company.ideas.first.thread.nil?}" 	
  	#puts "current_user.company.ideas.where(:thread!=nil).count: #{current_user.company.ideas.where(:thread!=nil).count}"
  	@root_ideas = current_user.company.ideas.where(thread: nil)
  	#if @companies.where(domain: domain).exists?
  	@idea = Idea.new # need for creating new on index page ??
  end


  def show
    @idea = Idea.find(params[:id])
    puts "@idea.body: #{@idea.body}"
    @comments = @idea.replies

    # if  !@comments.nil? #@comments?
    #   @subcomments = @comments.replies # this is L2 comments and all the farther I'll go for now
    # end
  end

  def create
    puts "in ideas_controller create"
    puts "params: #{params}"
    puts "params[:idea]: #{params[:idea]}"
    #puts "params[:idea][:user].name: #{params[:idea][:user].name}"
    @idea = Idea.new(params[:idea])
    current_user.ideas << @idea
    current_user.company.ideas << @idea
    puts "params[:idea][:thread].class: #{params[:idea][:thread].class}"
    thread = instance_variable_get(params[:idea][:thread])
    puts "thread: #{thread} "
    puts "thread.class: #{thread.class}"
    unless params[:idea][:thread].nil?
      params[:idea][:thread].replies << @idea  # this might need to be changed.  
      puts "set the reply to #{params[:idea][:thread].body}"
    end
    # need thread
    #params[:idea][:user].ideas << @idea # or is this in params?
    # current_user.company.ideas << @idea # or is this in params?
    @user = current_user # to pass to UserMailer

    if @idea.save
      puts "in if @idea.save, should send an email"
      UserMailer.idea_creation(@user, @idea).deliver
      flash[:success] = "Idea created succesfully!  You and your colleagues can now weigh in"
      idea_id = @idea.id
      redirect_to '/ideas'  # @user   
    else
      puts "in else - couldn't @idea.save"
      render 'new'
    end
  end   

    # private

    # def idea_params
    #   return params[:idea]
    #   #puts "params[:idea][:company_id]: #{params[:idea][:company_id]}"
    #   puts "in idea_params: params[:idea]: #{params[:idea][:body]}"
    #   # iparam = {}   # define it as a hash so it doesn't think it's an array!
    #   # iparam[:body] = params[:idea][:body]
    #   # #puts "pparam: #{pparam}"
    #   # iparam[:company_id] = params[:idea][:company_id]
    #   # #puts "2nd pparam: #{pparam}"
    #   # return pparam

    # end

# FROM PROJECT_CONTROLLER: ########################
  # def index
  #   #    @users = current_user.company.users.paginate(page: params[:page])  

  #   @projects = current_user.company.projects.all   # paginate(page: params[:page])
  #   @project = Project.new   # need this for creating new on index page
  # end


  # def show
  #   @project = Project.find(params[:id])
  #   puts "@project.name: #{@project.name}"
  #   @project_pfeedback = @project.pfeedbacks
  #   # @project_fb_array=[]
  #   # @project_pfeedback.each do |feedback_obj|
  #   #   if feedback_obj.pattribute
  #   #     puts "there was an attribute"
  #   #     @project_fb_array.push(feedback_obj.pattribute.name)
  #   #   end
  #   # end

  #   # following line causes error if there is no feedback
  #   # puts "@project_pfeedback.last.pattribute.name: #{@project_pfeedback.last.pattribute.name}"

  # end

  # # def show
  # #   @project = Project.find(params[:id])
  # #   # @microposts = @user.microposts.paginate(page: params[:page])
  # # end

  # def new
  # 	@project = Project.new
  # end

  # def create
  #   # do I need the next 2 lines?
  # 	# companies = Company.all
  # 	# domain_id = CompanyEmployee.find_by(user_id: (current_user.id))  # would now be company_id
  #   #puts "in projects_controller create"
  #   #@project = Project.new(project_params)
  #   @project = Project.new(project_params)
  #   current_user.projects << @project
  #   @user = current_user # to pass to UserMailer
  #   if @project.save
  #     puts "in if @project.save, should send an email"
  #     UserMailer.project_creation(@user, @project).deliver
  #     flash[:success] = "Project / Strategy / Effort created succesfully!  You and your colleagues can now weigh in"
  #     project_id = @project.id
  #     redirect_to '/projects/'+project_id.to_s   # @user   # todo: set this to rate the project once that exists
  #   else
  #     puts "in else - couldn't @project.save"
  #     render 'new'
  #   end
  # end    

  # # edit, update, and destroy pulled from Hartl's users_controller
  # def edit
  #   @project = Project.find(params[:id])
  # end

  # def update
  #   @project = Project.find(params[:id])
  #   if @project.update_attributes(project_params)  # what is update_attributes?
  #     flash[:success] = "Project updated"
  #     redirect_to @project
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   Project.find(params[:id]).destroy
  #   flash[:success] = "Project deleted."
  #   redirect_to projects_url
  # end


  # private

  #   def project_params
  #     puts "params[:project][:company_id]: #{params[:project][:company_id]}"  # correct
  #     puts "params[:project][:name]: #{params[:project][:name]}"  # correct
  #     pparam = {}   # define it as a hash so it doesn't think it's an array!
  #     pparam[:name] = params[:project][:name]
  #     #puts "pparam: #{pparam}"
  #     pparam[:company_id] = params[:project][:company_id]
  #     #puts "2nd pparam: #{pparam}"
  #     return pparam

  #   end



end
