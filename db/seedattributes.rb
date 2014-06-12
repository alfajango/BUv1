	#--------------- Attributes ------------------------------
def seedattributes


	# attributge_name, category, identifier
	sentence_list = [
		[ "completing the project", "nicejob"],
		[ "meeting the deadline", "nicejob"],
		[ "on the presentation", "nicejob"],
		[ "getting the sale", "nicejob"],
		[ "helping the team", "nicejob"],
		[ "closing the deal", "nicejob"],
		[ "building the customer relationship", "nicejob"],
		[ "deserves a raise", "nicejob"],
		[ "- deserves a promotion", "nicejob"],
		[ "- deserves a bonus", "nicejob"],
		[ "- deserves more recognition", "nicejob"],
		
		[ "completing projects", "greatat"],
		[ "doing high quality work", "greatat"],
		[ "getting things done", "greatat"],
		[ "working efficiently", "greatat"],
		[ "working independently", "greatat"],
		[ "displaying honesty", "greatat"],
		[ "having confidence", "greatat"],
		[ "having passion", "greatat"],
		[ "being a team player", "greatat"],
		[ "leadership", "greatat"],
		[ "management", "greatat"],

		[ "for helping me", "thanks"],
		[ "for helping the team", "thanks"],
		[ "for all the hard work", "thanks"],
		[ "for the extra effort", "thanks"],
		[ "you saved the day", "thanks"],
		[ "for the information", "thanks"],
		[ "for the contact", "thanks"],
		[ "for your time", "thanks"],
		[ " - I owe you one!", "thanks"],

		[ "communication", "workon"],
		[ "job knowledge", "workon"],
		[ "work output", "workon"],
		[ "work ethic", "workon"],
		[ "presentation skills", "workon"],
		[ "attitude", "workon"],
		[ "building rapport with colleagues", "workon"],
		[ "building rapport with clients", "workon"],
		[ "building credibility", "workon"],
		[ "finishing projects", "workon"],
		[ "getting additional training", "workon"],
		[ "giving credit where it's due", "workon"],
		[ "closing more business", "workon"],
		[ "accuracy", "workon"],
		[ "avoiding mistakes", "workon"],
		[ "staying on task", "workon"],

		[ "poor job knowledge", "alert"],
		[ "poor leadership", "alert"],
		[ "poor people skills", "alert"],
		[ "poor management", "alert"],
		[ "poor customer skills", "alert"],
		[ "doesn't get things done", "alert"],
		[ "not in the right role", "alert"],
		[ "in over his/her head", "alert"],
		[ "wrong fit for the company", "alert"],
		[ "difficult to work for", "alert"]

	]	
	# to add additional attributes without wiping out these, and user generated, add a 2nd sentence_list

	attrib = Attribute.all
	# to re-seed, uncomment these the following several lines.  All existing attributes will be wiped out
	attrib.delete_all
	sentence_list.each do |attribute_name, category, identifier|
	  Attribute.create!(  attribute_name: attribute_name, 
	                 category: category)
	end
	puts 'ATTRIBUTES'
end