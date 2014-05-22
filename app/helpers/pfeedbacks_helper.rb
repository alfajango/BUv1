module PfeedbacksHelper
  def num_pfbvotes(feedback)
  	#puts "in num_votes, idea.body: #{idea.body}"
  	@pfeedback_upvotes=0
  	@pfeedback_downvotes=0
  	pfeedback.fbvotes.each do | vote | 
  	  @pfeedback_upvotes += vote.upvote 
  	  @pfeedback_downvotes += vote.downvote
  	end
  end
end
