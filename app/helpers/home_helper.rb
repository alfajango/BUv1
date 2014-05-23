module HomeHelper
  def set_fbs(user)
  	puts "in HomeHelper set_fbs"
	#@user = User.find(params[:id])
    #puts "@user.name: #{@user.name}"
    @users_feedback = user.feedbacks
    @users_nicejob =[]
    @users_greatat =[]
    @users_thanks =[]
    @users_workon =[]
    @users_alert =[]

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
        puts "PROBLEM in set_fbs"
      end
    end
  end    

  def set_pfbs(project)
    @pattributes = Pattribute.all
    @project = project   # Project.find(params[:id])
    puts "@project.name: #{@project.name}"
    @projects_feedback = @project.pfeedbacks
    @projects_positive =[]
    @projects_needs =[]
    @projects_negative =[]

    @projects_feedback.each do |pfeedback|
      case pfeedback.pattribute.category
      when "positive"
        @projects_positive << pfeedback
      when "needs"
        @projects_needs << pfeedback
      when "negative"
        @projects_negative << pfeedback
      else
        puts "PROBLEM in HomeHelper set_pfbs"
      end
    end
  end

end
