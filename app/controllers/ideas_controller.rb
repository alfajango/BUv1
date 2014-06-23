class IdeasController < ApplicationController

  def index
    puts "in ideas_controller index"

  	#@ideas = current_user.company.ideas.all
  	first_idea = Idea.first
  	#puts "current_user.company.ideas.first.thread.nil?: #{current_user.company.ideas.first.thread.nil?}" 	
  	#puts "current_user.company.ideas.where(:thread!=nil).count: #{current_user.company.ideas.where(:thread!=nil).count}"
    # PERF: This will do an extra query for current_user.company that isn't necessarily needed.
    #   Could do @root_ids = Idea.where(thread: nil, company_id: current_user.company_id)
  	@root_ideas = current_user.company.ideas.where(thread: nil)
    #@root_ideas = root_ideas.first
  	#if @companies.where(domain: domain).exists?
  	@idea = Idea.new # need for creating new on index page ??
  end


  def show
    puts "in ideas_controller show"
    #@idea = Idea.find(params[:id])  # NO!
    #puts "@idea.body: #{@idea.body}"
    #@comments = @idea.replies
    @idea = Idea.new

    # add this from index action because show lists all the root ideas also
    # PERF: This does an unnecessary query (see note in index action)
    @root_ideas = current_user.company.ideas.where(thread: nil)

    #?:
    # PERF: This does an unnecessary query (see note in index action)
    @ideas = current_user.company.ideas.where(thread: nil)
  end 


  def create
    puts "in ideas_controller create"

    @idea = Idea.new(params[:idea])
    current_user.ideas << @idea
    current_user.company.ideas << @idea

    unless params[:idea][:thread_id].nil?
      # SEC: Scope thread idea by current_user.company
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
      if thread_id = params[:idea][:thread_id]
        # CLEANUP: Consider using path helpers here in case routes change in the future.
        #   e.g. redirect_to idea_path(params[:idea][:thread_id])
        redirect_to '/ideas/'+thread_id   
      else # this is root
        # CLEANUP: Consider using path helpers here in case routes change in the future.
        #   e.g. redirect_to ideas_path
        redirect_to '/ideas'
      end
    else
      puts "in else - couldn't @idea.save"
      render 'new'
    end
  end   

  def edit
    # SEC: Scope ideas to those allowed or in current_user.company
    @idea = Idea.find(params[:id])
  end

  def update
    # SEC: Scope ideas to those allowed or in current_user.company
    @idea = Idea.find(params[:id])
    # SEC: Do some parameter sanitization so that the user cannot set
    #   e.g. user_id, company_id, or thread_id via mass assignemnt.
    if @idea.update_attributes(params[:idea])  # what is update_attributes?
      flash[:success] = "Idea updated"
      redirect_to @idea
    else
      render 'edit'
    end
  end  

  def destroy
    # SEC: Scope ideas to those allowed or in current_user.company
    Idea.find(params[:id]).destroy
    flash[:success] = "Idea deleted."
    redirect_to ideas_url
  end

end
