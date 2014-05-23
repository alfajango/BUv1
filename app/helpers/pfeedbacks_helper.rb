module PfeedbacksHelper
  def num_fbvotes(pfeedback)
  	puts "in num_fbvotes"
  	@pfeedback_upvotes=0
  	@pfeedback_downvotes=0
  	pfeedback.fbvotes.each do | vote | 
  	  @pfeedback_upvotes += vote.upvote 
  	  @pfeedback_downvotes += vote.downvote
  	end
  end
end
