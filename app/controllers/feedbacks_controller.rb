class FeedbacksController < ApplicationController
  #before_action :signed_in_user  # PG todo: put back in. take out because heroku says no method

  # def create #make this work for feedbacks - it came from relationships controller 
  #   @user = User.find(params[:relationship][:followed_id])
  #   current_user.follow!(@user)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   endΩ
  # end

  def new
    puts "in FeedbacksController new action"
    @feedback = Feedback.new
  	# @relationship = Relationship.new
  end

  def create # this called from users/show.html.erb
    puts "in feedbacks_controller create action "
    puts "params: #{params}"

    #from_id = User.find(from_id)


    #method to do something without going to another page: http://stackoverflow.com/questions/2139996/ruby-on-rails-redirect-toback
    session[:return_to] ||= request.referer
    #Feedback.create(params[:feedback])
    attrib_obj = Attribute.find(params[:feedback][:attribute])
    to_user_obj = User.find(params[:feedback][:user])
    fb = Feedback.create!(from_id: params[:feedback][:from_id], rating_given: params[:feedback][:rating_given])  
    fb.attribute = attrib_obj
    to_user_obj.feedbacks << fb
    redirect_to session.delete(:return_to)

  end


  def attribute_selected
    put "in feedbacks_controller attribute_selected"
    #@attribute=Attribute.all
    puts "params: #{params}"
    attrib_obj = params[:attribute] # ??
    to_user = params[:user] # fix
    to_user = User.find(params[:id])
    fb = Feedback.create!(from_id: from_id, rating_given: 1)  
    fb.attribute = attrib_obj
    to_user.feedbacks << fb
  end


  # def complete
  #   puts "in complete"

  #   @attribute=Attribute.all
  #   @user = User.find(params[:id])
  #   params[:attribute_checkbox].each do |check|

  #      attribute_identifier = check

  #     #t = Feedback.find_by_id(attribute_id) # don't need this since I'm always creating new

  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                 attribute_identifier: attribute_identifier);

  #    end
  #   flash[:success] = "Feedback saved.  Feedback will show up after midnight EST tonight"
  #   redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
  # end

  # def slider_complete
  #   puts "in slider_complete"
  #   #puts "params[:id]: #{params[:id]}"
  #   #puts "params: #{params}"
  #   #puts "comScore: #{params[:comScore]}"

  #   @attribute=Attribute.all
  #   @user = User.find(params[:id])
  #   params[:comScore]
  #   if params[:resultsScore].to_i > 0
  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                      attribute_identifier: 1001, rating_given: params[:resultsScore]);
  #   end
  #   if params[:jkScore].to_i > 0
  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                      attribute_identifier: 1002, rating_given: params[:jkScore]);
  #   end
  #   if params[:initiativeScore].to_i > 0
  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                      attribute_identifier: 1003, rating_given: params[:initiativeScore]);
  #   end
  #   if params[:commScore].to_i > 0
  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                      attribute_identifier: 1004, rating_given: params[:commScore]);
  #   end
  #   if params[:leadershipScore].to_i > 0
  #     Feedback.create(from_id: current_user.id, to_id: @user.id, 
  #                      attribute_identifier: 1005, rating_given: params[:leadershipScore]);
  #   end

  #   flash[:success] = "Feedback saved.  Feedback will show up after midnight EST tonight"
  #   redirect_to root_url  # TODO - don't go home.  stay on the page.  use ajax?
  # end

end

