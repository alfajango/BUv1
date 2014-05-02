class VotesController < ApplicationController

  def create
    #Vote.create(upvote: upvote, downvote: downvote, idea: idea, created: Time.now,  user: current_user)
    puts "params: #{params}"
    puts "params[:vote] #{params[:vote]}"
    puts "params[:vote][:upvote]: #{params[:vote][:upvote]}"

    @vote = Vote.new(vote_params)
    
    # if @vote.save
    #   flash[:success] = "Thanks for the vote"
    #   redirect_to '#'
    # else
    #   flash[:success] = "FAIL"
    # end
  end

  def update
  	puts "in VotesController update action which is empty"
  end


  private

    def vote_params
      #puts "params[:project][:company_id]: #{params[:project][:company_id]}"  # correct
      #puts "params[:project][:name]: #{params[:project][:name]}"  # correct
      vparam = {}   # define it as a hash so it doesn't think it's an array!
      #vparam[:]
      vparam[:user] = params[:vote][:user]
      puts "vparam: #{vparam}"
      vparam[:idea] = params[:vote][:idea]
      puts "vparam: #{vparam}"
      vparam[:downvote] = params[:vote][:downvote]
      puts "vparam: #{vparam}"
      vparam[:upvote] = params[:vote][:upvote]
      puts "vparam: #{vparam}"
      vparam[:created] = params[:vote][:created]
      puts "vparam: #{vparam}"
      #puts "2nd pparam: #{pparam}"
      return vparam

    end
end
