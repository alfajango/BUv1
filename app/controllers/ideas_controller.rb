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
  end

  def create

    @idea = Idea.new(params[:idea])
    current_user.ideas << @idea
    current_user.company.ideas << @idea

    unless params[:idea][:thread_id].nil?
      thread = Idea.find_by(id: params[:idea][:thread_id])
      puts "thread.body: #{thread.body}"
      thread.replies << @idea  # this might need to be changed.  
      puts "set the reply to #{thread.body}"
    end

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




end
