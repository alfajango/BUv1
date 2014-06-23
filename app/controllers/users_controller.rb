# had to get rid of contents or create user would be called twice
# if I get rid of it all, /users fails, so just get rid of create action

class UsersController < ApplicationController
  # SEC: Uncomment necessary authorization filters
  # before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_action :correct_user,   only: [:edit, :update]
  # # before_action :admin_user,     only: [:destroy, :admin_user]
  # before_action :admin_user,     only: :destroy

  def index
    # #@users = User.paginate(page: params[:page])
    @users = current_user.company.users.paginate(page: params[:page], per_page: 25 )  
    #@users = current_user.company.users #.all  # paginate not in mongoid
  end

  def show
    puts "in users_controller show, params: #{params}"

    # add this line from index action for spefdesign compatability
    @users = current_user.company.users.paginate(page: params[:page], per_page: 25 )  


    @attributes = Attribute.all
    # SEC: Scope users to those allowed or from current company
  	@user = User.find(params[:id])
    puts "@user.name: #{@user.name}"
    @users_feedback = @user.feedbacks
    @users_nicejob =[]
    @users_greatat =[]
    @users_thanks =[]
    @users_workon =[]
    @users_alert =[]

    # PERF/CLEANUP: Use group_by method here
    #   e.g. @users_feedback = @user.feedbacks.group_by { |fb| fb.attribute.category }
    #   then use with @users_feedback["nicejob"], etc.
    @users_feedback.each do |feedback|
      case feedback.attribute.category
      when "nicejob"
        @users_nicejob << feedback
      when "greatat"
        @users_greatat << feedback
      when "thanks"
        @users_thanks << feedback
      when "workon"
        @users_workon << feedback
      when "alert"
        @users_alert << feedback
      else
        puts "PROBLEM in users_controller show"
      end
    end
    #@users_nicejob = @users_feedback.find_by(attribute.category == "nicejob")

    # for job creation:
    # SEC: Scope jobs subject (i.e. target user) id by users allowed or by company
    @users_jobs = Job.where(subject: params[:id])

    # SEC: Scope jobs holder (i.e. target jobs) id by users allowed or by company
    @users_for_this_job = Job.where(job_holder: params[:id])

    @job = Job.new # this calls jobs_controller create action, I believe
    @attribute = Attribute.new #??

    #@feedback = Feedback.new
      # Feedback.create(from_id: current_user.id, to_id: @user.id, 
      #             attribute_identifier: attribute_identifier);

    # for feedback creation
    

  end

  def myfeedback
    #puts "in users_controller show, params: #{params}"
    @user = current_user
    #puts "@user.name: #{@user.name}"
    @users_feedback = @user.feedbacks
    @users_nicejob =[]
    @users_greatat =[]
    @users_thanks =[]
    @users_workon =[]
    @users_alert =[]

    # PERF/CLEANUP: Use group_by method here
    @users_feedback.each do |feedback|
      case feedback.attribute.category
      when "nicejob"
        @users_nicejob << feedback
      when "greatat"
        @users_greatat << feedback
      when "thanks"
        @users_thanks << feedback
      when "workon"
        @users_workon << feedback
      when "alert"
        @users_alert << feedback
      else
        puts "PROBLEM in users_controller myfeedback"
      end
    end

    @ask = Ask.new  # somehow, it will know to go to AskController create action??

        ## for modal ###
   
    # @book = @user
    # respond_to do |format|
    # format.html # show.html.erb
    # format.js # show.js.erb
    # format.json { render json: @book }
    @users_jobs = Job.where(subject: current_user.id)

    @users_for_this_job = Job.where(job_holder: current_user.id)
  end

  def create_colleague
    puts "in create action in users_controller"
    @user = User.new   # ???
    render "/users/invitations/new"
  end

  def invitations
    puts "in invitations action in users_controller"
  end

  def homepage
    # SEC: Scope user by users allowed or in current_user company
    @user = User.find(params[:id])
    # should it be User.all ?
    render homepage
  end


  # def coworker_chart
  #   # @user = User.paginate(page: params[:page])
  #   @user = User.all
  # end

  def new
  	@user = User.new
  end


  def edit
    # SEC: Scope user by users allowed or in current_user company
    @user = User.find(params[:id])
  end

  def update
    # SEC: Scope user by users allowed or in current_user company
    @user = User.find(params[:id])
    # SEC: See security note for user_params below
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    # SEC: Scope user by users allowed or in current_user company
    User.find(params[:id]).destroy
    flash[:success] = "User delted."
    redirect_to users_url
  end


  def feedback
  end



private

  	def user_params
      # add admin per Exercise 9.6.1
      # SEC: Don't permit :admin attribute via mass assignment
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
      # SEC: Scope or limit user by id as necessary
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
