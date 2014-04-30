module IdeasHelper

  def set_idea(params)
    idea = Idea.find_by(id: params[:id])  # return idea is implied
  end

  def num_votes(idea)
  	puts "in num_votes, idea.body: #{idea.body}"
  	@idea_upvotes=0
  	@idea_downvotes=0
  	idea.votes.each do | vote |
  	  if vote == 1
  	  	puts "upvote"
  	    @idea_upvotes += 1
  	  elsif	vote == -1
  	  	puts "downvote"
  	  	@idea_downvotes -- 1
  	  end
  	end
  end
end
