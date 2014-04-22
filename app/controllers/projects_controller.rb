class ProjectsController < ApplicationController

  def index
    #    @users = current_user.company.users.paginate(page: params[:page])  

    @projects = current_user.company.projects.all   # paginate(page: params[:page])
    @project = Project.new   # need this for creating new on index page
  end


  def show
    @project = Project.find(params[:id])
    puts "@project.name: #{@project.name}"
    @project_pfeedback = @project.pfeedbacks
    # @project_fb_array=[]
    # @project_pfeedback.each do |feedback_obj|
    #   if feedback_obj.pattribute
    #     puts "there was an attribute"
    #     @project_fb_array.push(feedback_obj.pattribute.name)
    #   end
    # end
    puts "@project_pfeedback.last.pattribute.name: #{@project_pfeedback.last.pattribute.name}"

  end

  # def show
  #   @project = Project.find(params[:id])
  #   # @microposts = @user.microposts.paginate(page: params[:page])
  # end

  def new
  	@project = Project.new
  end

  def create
    # do I need the next 2 lines?
  	# companies = Company.all
  	# domain_id = CompanyEmployee.find_by(user_id: (current_user.id))  # would now be company_id
    puts "in projects_controller create"
    #@project = Project.new(project_params)
    @project = Project.new(project_params)
    if @project.save
      puts "in if @project.save"
      flash[:success] = "Project / Strategy / Effort created succesfully!  You and your colleagues can now weigh in"
      project_id = @project.id
      redirect_to '/projects/'+project_id.to_s   # @user   # todo: set this to rate the project once that exists
    else
      puts "in else - couldn't @project.save"
      render 'new'
    end
  end    

  private

    def project_params
      puts "params[:project][:company_id]: #{params[:project][:company_id]}"  # correct
      puts "params[:project][:name]: #{params[:project][:name]}"  # correct
      pparam = {}   # define it as a hash so it doesn't think it's an array!
      pparam[:name] = params[:project][:name]
      puts "pparam: #{pparam}"
      pparam[:company_id] = params[:project][:company_id]
      puts "2nd pparam: #{pparam}"
      return pparam

    end

end
