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
end
