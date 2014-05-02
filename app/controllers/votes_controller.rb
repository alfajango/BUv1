class VotesController < ApplicationController

  def create

    puts "params: #{params}"
    puts "params[:vote]: #{params[:vote]}"
    puts "params[:vote][:idea_id]: #{params[:vote][:idea_id]}"

    idea = Idea.find_by(id: params[:vote][:idea_id])
    puts "votes_controller idea.body: #{idea.body}"
    @vote = Vote.new(params[:vote])
    idea.votes << @vote
    current_user.votes << @vote
    if @vote.save
      flash[:success] = "Thanks for the vote"
      redirect_to '#'
    else
      flash[:success] = "FAIL"
    end
  end

  def update
  	puts "in VotesController update action which is empty"
  end


end
