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

    @job = Job.new # this calls jobs_controller create action, I believe
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
