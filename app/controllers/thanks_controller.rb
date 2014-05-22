class ThanksController < ApplicationController

  def create # this called from users/show.html.erb?? when clicking on the temporary button
    #method to do something without going to another page: http://stackoverflow.com/questions/2139996/ruby-on-rails-redirect-toback
    puts "params[:thank]: #{params[:thank]}"
    session[:return_to] ||= request.referer
    fb_id = params[:thank][:feedback_id]  # these lines should be overkill, but do explicitly until it's working
    parent = Feedback.find(fb_id)
    Thank.create!(feedback: parent, created: Time.now)
    puts "after Thank.create!"
    redirect_to session.delete(:return_to)
    flash[:success] = "Thanks received"

  end

end
