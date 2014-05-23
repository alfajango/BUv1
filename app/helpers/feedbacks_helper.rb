module FeedbacksHelper

  def num_fbvotes(feedback)
  	@feedback_upvotes=0
  	@feedback_downvotes=0
  	feedback.fbvotes.each do | vote | 
  	  @feedback_upvotes += vote.upvote 
  	  @feedback_downvotes += vote.downvote
  	end
  end

end
