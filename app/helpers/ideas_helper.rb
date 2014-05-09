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

  def ideas_for_homepage
    @show_ideas = Array.new
    root_ideas = current_user.company.ideas.where(thread: nil)
    #company_users = current_user.company.users

    count = 1  
    root_ideas.reverse_each do |idea|   # traverse newest (last) first
      if count > 3
        return
      end  
      unless (@show_ideas.include?(idea))
        @show_ideas.push(idea)
      count += 1
      end
    end
  end

end
