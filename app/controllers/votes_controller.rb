class VotesController < ApplicationController

  def create

    #puts "params: #{params}"
    #puts "params[:vote]: #{params[:vote]}"
    #puts "params[:vote][:idea_id]: #{params[:vote][:idea_id]}"

    idea = Idea.find_by(id: params[:vote][:idea_id])
    #puts "votes_controller idea.body: #{idea.body}"
    puts "params[:vote][:upvote]: #{params[:vote][:upvote] }"
    puts "params[:vote][:downvote]: #{params[:vote][:downvote] }"
    priorvote = Vote.find_by(idea: idea, user:current_user)
    puts "priorvote[:upvote]: #{priorvote[:upvote] }"
    puts "priorvote[:downvote]: #{priorvote[:downvote] }"

    # check to see if this is a duplicate vote
    if priorvote = Vote.find_by(idea: idea, user:current_user) # did this person already vote, up or down, for this idea?
      if params[:vote][:upvote] == 1 && priorvote[:upvote] == 1 
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:vote][:downvote] == 1 && priorvote[:downvote] == 1
        # do nothing, the person already voted this way
        puts "nothing done, this user already made this vote"
      elsif params[:vote][:upvote] == 1 && priorvote[:downvote] ==1  
        # destroy the old vote and don't make a new one
        Idea.find(params[:id]).destroy  # is this the right way to fine?
        puts "vote destoyed because opposite vote entered"
      elsif params[:vote][:downvote] == 1 && priorvote[:upvote] ==1
        # destroy the old vote and don't make a new one
        Idea.find(params[:id]).destroy  # is this the right way to fine?
        puts "vote destoyed because opposite vote entered"      
      end
    else # create the new vote
      puts "going to create vote"
      @vote = Vote.new(params[:vote])
      idea.votes << @vote
      current_user.votes << @vote
      if @vote.save
        flash[:success] = "vote received"
        redirect_to '#'  # can I return false here so that I don't redirect to new page?
      else
        flash[:success] = "FAIL"
      end
    end
  end


  def update
  	puts "in VotesController update action which is empty"
  end


end
