class IdeasController < ApplicationController

  def index
    puts "in ideas_controller index"

  	#@ideas = current_user.company.ideas.all
  	first_idea = Idea.first
  	puts "current_user.company.ideas.first.thread.nil?: #{current_user.company.ideas.first.thread.nil?}" 	
  	#puts "current_user.company.ideas.where(:thread!=nil).count: #{current_user.company.ideas.where(:thread!=nil).count}"
  	@root_ideas = current_user.company.ideas.where(thread: nil)
  	#if @companies.where(domain: domain).exists?
  	@idea = Idea.new # need for creating new on index page ??
  end


  def show
    puts "in ideas_controller show"
    #@idea = Idea.find(params[:id])  # NO!
    #puts "@idea.body: #{@idea.body}"
    #@comments = @idea.replies
    @idea = Idea.new
  end 


  def create
    puts "in ideas_controller create"

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

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])  # what is update_attributes?
      flash[:success] = "Idea updated"
      redirect_to @idea
    else
      render 'edit'
    end
  end  

  def destroy
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea deleted."
    redirect_to ideas_url
  end

end
