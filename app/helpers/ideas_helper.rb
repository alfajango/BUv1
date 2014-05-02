module IdeasHelper

  def set_idea(params)
    idea = Idea.find_by(id: params[:id])  # return idea is implied
  end

  def num_votes(idea)
  	#puts "in num_votes, idea.body: #{idea.body}"
  	@idea_upvotes=0
  	@idea_downvotes=0
  	idea.votes.each do | vote |
  	  @idea_upvotes += vote.upvote 
  	  @idea_downvotes += vote.downvote
  	end
  end
end
