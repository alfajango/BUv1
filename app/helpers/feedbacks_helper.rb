module FeedbacksHelper

  def num_fbvotes(feedback)
    # PERF: This can be done with count queries that don't require loading all vote objects from db.
    #   e.g. @feedback_upvotes = feedback.fbvotes.where(upvote: 1).count
    #        @feedback_downvotes = feedback.fbvotes.where(downvote: 1).count
  	@feedback_upvotes=0
  	@feedback_downvotes=0
  	feedback.fbvotes.each do | vote | 
  	  @feedback_upvotes += vote.upvote 
  	  @feedback_downvotes += vote.downvote
  	end
  end

end
