# had to get rid of contents or create user would be called twice
# if I get rid of it all, /users fails, so just get rid of create action

class UsersController < ApplicationController
  # before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_action :correct_user,   only: [:edit, :update]
  # # before_action :admin_user,     only: [:destroy, :admin_user]
  # before_action :admin_user,     only: :destroy

  def index
    # #@users = User.paginate(page: params[:page])
    #@users = current_user.company.users.paginate(page: params[:page])  
    @users = current_user.company.users.all  # paginate not in mongoid
  end

  def show
    puts "in users_controller show, params: #{params}"
  	@user = User.find(params[:id])
    puts "@user.name: #{@user.name}"
    @users_feedback = @user.feedbacks



    # for job creation:
    @users_jobs = Job.where(subject: params[:id])
    @users_for_this_job = Job.where(job_holder: params[:id])
    author = current_user
    subject = @user

    if params[:name]
      puts "in if, params[:name]: #{params[:name]}"
      job_holder = User.find_by(name: params[:name])
    # elsif params[:email]
    #   puts "in if, params[:email]: #{params[:email]}"
    #   job_holder = User.find_by(email: params[:email])
    else
      puts "params[:name] was not defined"
    end

    # @job = Job.create!(author: author, subject: subject, job_holder: job_holder, created: Time.now) # this is tough because params contains lots of other stuff here also.  maybe ok.  
    

    #
    #author.jobs << @job  # how do I say it's the job's author?
    #params[:user_id]
    # @users_fb_array=[]
    # @users_feedback.each do |feedback_obj|
    #   if feedback_obj.attribute
    #     puts "there was an attribute"
    #     @users_fb_array.push(feedback_obj.attribute.attribute_name)
    #   end
    # end
    # # puts "users_fb_array[0]: #{users_fb_array[0]}"

    # The following line can cause a failure if there are no feedbacks
    # puts "@users_feedback.last.attribute.attribute_name: #{@users_feedback.last.attribute.attribute_name}"
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  def homepage
    @user = User.find(params[:id])
    # should it be User.all ?
    render homepage
  end


  def coworker_chart
    # @user = User.paginate(page: params[:page])
    @user = User.all
  end

  def new
  	@user = User.new
  end
  
  # def create  # where is this called from?
  #   puts "in users_controller create()"
  #   @user = User.new(user_params)   
  #   @companies = Company.all
  #   domain = @user.email.split("@").last
  #   name = domain.split(".com").first.capitalize
  #   if @companies.find_by(domain: domain)
  #     puts " this company already exists in BumptUp "
  #   else 
  #     puts " first user in this company "
  #     Company.create!(domain: domain, name: name)  
  #   end 

  #   if @user.save
  #     sign_in @user
  #     puts "in if @user.save"
  #     #put CompanyEmployee.create here because it needs to be done after @user.save
  #     @companies=Company.all
  #     puts "after @companies = Company.all in users_controller"
  #     company_id = @companies.find_by(domain: domain).id
  #     puts "company_id #{company_id}"
  #     CompanyEmployee.create!(company_id:(@companies.find_by(domain: domain).id), user_id: @user.id)
  #     puts "CompanyEmployee created"

  #     flash[:success] = "Account created succesfully!  Welcome to #{name}'s BumptUp network."
  #     redirect_to '#'   # @user   # redirects to user show page (users/show.html.erb)
  #   else
  #     render 'new'
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User delted."
    redirect_to users_url
  end

  # def following
  #   @title = "Following"
  #   @user = User.find(params[:id])
  #   @users = @user.followed_users.paginate(page: params[:page])
  #   render 'show_follow'
  # end

  # def followers
  #   @title = "Followers"
  #   @user = User.find(params[:id])
  #   @users = @user.followers.paginate(page: params[:page])
  #   render 'show_follow'
  # end

  #def give_feedback
  #end

  def feedback
  end



private

  	def user_params
      # add admin per Exercise 9.6.1
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  	end

    # Before filters

    ### re 10.3, move signed_in_user to the Sessions helper so that Microposts controller can use it also
    # def signed_in_user
    #   unless signed_in?
    #     store_location
    #     redirect_to signin_url, notice: "Please sign in."
    #   end
    # end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
