class AsksController < ApplicationController

  def create
  	session[:return_to] ||= request.referer

  	puts "params[:ask]: #{params[:ask]}"
    fb_id = params[:ask][:feedback_id]  
    puts "first fb_id: #{fb_id}"
  	fb = Feedback.find(fb_id)
  	@ask = Ask.create!(feedback: fb,
  					created: Time.now,
  					emailed: Time.now,
  					ask_text: "#{current_user.name} has seen your recent feedback and requests some more 
  					information about what he/she is doing well and what can be improved.  To anonymously 
  					provide this information, click here." )


  	askee = User.find(fb.from_id)
  	puts "askee.name: #{askee.name}"
    @user = current_user # to pass to UserMailer

    if @ask.save
      puts "in if @idea.save, should send an email"
      UserMailer.feedback_ask(askee).deliver
      redirect_to session.delete(:return_to)
      flash[:success] = "Message sent. You will receive an email if a response is received."
    else
      puts "in else - couldn't @ask.save"
      render '#'
    end
  end  

end
