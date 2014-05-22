class VotesController < ApplicationController

  def create
    idea = Idea.find_by(id: params[:vote][:idea_id])
    priorvote = Vote.where(idea: idea, user: current_user).first#if Vote.find_by(idea: idea, user:current_user).exists? 
    #puts "priorvote: #{priorvote}"
    if priorvote #= Vote.find_by(idea: idea, user:current_user) # did this person already vote, up or down, for this idea?
      #puts "priorvote[:upvote]: #{priorvote[:upvote]}"
      #puts "priorvote[:upvote].class: #{priorvote[:upvote].class}"
      if params[:vote][:upvote].to_i == 1 && priorvote[:upvote].to_i == 1 
      #  if params[:vote][:upvote].to_i == 1 && priorvote[:upvote].to_i == 1  # this worked before 
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:vote][:downvote].to_i == 1 && priorvote[:downvote].to_i == 1
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:vote][:upvote].to_i == 1 && priorvote[:downvote].to_i == 1  
        # destroy the old vote and don't make a new one
        priorvote.destroy
        flash[:success] = "Vote received"
        puts "vote destoyed because opposite vote entered"
      elsif params[:vote][:downvote].to_i == 1 && priorvote[:upvote].to_i ==1
        # destroy the old vote and don't make a new one
        priorvote.destroy
        flash[:success] = "Vote received"
        puts "vote destoyed because opposite vote entered"  
      else
        puts "PROBLEM: none of the above"    
      end
      redirect_to :back  # avoid going to that nothing page?
    else # create the new vote
      puts "going to create vote"
      @vote = Vote.new(params[:vote])
      idea.votes << @vote
      current_user.votes << @vote
      if @vote.save
        flash[:success] = "Vote received"
        redirect_to :back  # just reload, so that we see the vote in the total
      else
        flash[:success] = "FAIL"
      end
    end
  end


  def update
  	puts "in VotesController update action which is empty"
  end


end
