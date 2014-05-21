class FbvotesController < ApplicationController

  def create
    feedback = Feedback.find_by(id: params[:fbvote][:feedback_id])
    priorvote = Fbvote.where(feedback: feedback, user: current_user).first#if Vote.find_by(idea: idea, user:current_user).exists? 
    #puts "priorvote: #{priorvote}"
    if priorvote #= Vote.find_by(idea: idea, user:current_user) # did this person already vote, up or down, for this idea?
      #puts "priorvote[:upvote]: #{priorvote[:upvote]}"
      #puts "priorvote[:upvote].class: #{priorvote[:upvote].class}"
      if params[:fbvote][:upvote].to_i == 1 && priorvote[:upvote].to_i == 1 
      #  if params[:vote][:upvote].to_i == 1 && priorvote[:upvote].to_i == 1  # this worked before 
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:fbvote][:downvote].to_i == 1 && priorvote[:downvote].to_i == 1
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:fbvote][:upvote].to_i == 1 && priorvote[:downvote].to_i == 1  
        # destroy the old vote and don't make a new one
        priorvote.destroy
        puts "vote destoyed because opposite vote entered"
      elsif params[:fbvote][:downvote].to_i == 1 && priorvote[:upvote].to_i ==1
        # destroy the old vote and don't make a new one
        priorvote.destroy
        puts "vote destoyed because opposite vote entered"  
      else
        puts "PROBLEM: none of the above"    
      end
      redirect_to :back  # avoid going to that nothing page?
    else # create the new vote
      puts "going to create vote"
      @fbvote = Fbvote.new(params[:fbvote])
      feedback.votes << @fbvote
      current_user.votes << @fbvote
      if @fbvote.save
        flash[:success] = "fbvote received"
        redirect_to :back  # just reload, so that we see the vote in the total
      else
        flash[:success] = "FBVOTE FAIL"
      end
    end
  end


  def update
  	puts "in FbvotesController update action which is empty"
  end



end
