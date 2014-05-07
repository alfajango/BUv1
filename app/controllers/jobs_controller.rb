class JobsController < ApplicationController

  def create
  	puts "in JobsController create, params: #{params}"
    author = current_user

    if params[:job][:job_holder]
      job_holder = User.find_by(name: params[:job][:job_holder])
    # elsif params[:email]
    #   puts "in if, params[:email]: #{params[:email]}"
    #   job_holder = User.find_by(email: params[:email])
    else
      puts "params[:job][:job_holder] was not defined"
    end

    #@job = Job.new(params[:job]) # correct?
    @job = Job.new(author: author, subject: params[:job][:subject], job_holder: job_holder, created: Time.now)
    
    if @job.save
      puts "in if @job.save"
      #UserMailer.project_creation(@user, @project).deliver
      flash[:success] = "Job recommendation created"
      #project_id = @project.id
      redirect_to '#' #   # @user   # todo: set this to rate the project once that exists
    else
      puts "in else - couldn't @job.save"
      render 'new'
    end
  end    


end
