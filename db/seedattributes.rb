	#--------------- Attributes ------------------------------
def seedattributes
	attrib = Attribute.all
	attrib.delete_all

	# attributge_name, category, identifier
	sentence_list = [
		[ "completing the project", "nicejob"],
		[ "meeting the deadline", "nicejob"],
		[ "the presentation", "nicejob"],
		[ "getting the sale", "nicejob"],
		[ "helping the team", "nicejob"],
		[ "closing the deal", "nicejob"],
		[ "building the customer relationship", "nicejob"],
		[ "deserves a raise", "nicejob"],
		[ "deserves a promotion", "nicejob"],
		[ "deserves a bonus", "nicejob"],
		[ "deserves more recognition", "nicejob"],
		
		[ "completing the project", "greatat"],
		[ "high quality work", "greatat"],
		[ "getting things done", "greatat"],
		[ "working efficiently", "greatat"],
		[ "working independently", "greatat"],
		[ "honesty", "greatat"],
		[ "confidence", "greatat"],
		[ "passion", "greatat"],
		[ "being a team player", "greatat"],
		[ "leadership", "greatat"],
		[ "management", "greatat"],

		[ "for the help", "thanks"],
		[ "for the information", "thanks"],
		[ "for the contact", "thanks"],
		[ "for the time", "thanks"],

		[ "communication", "workon"],
		[ "job knowledge", "workon"],
		[ "work output", "workon"],
		[ "work ethic", "workon"],
		[ "presentation skills", "workon"],
		[ "attitude", "workon"],
		[ "building rapport", "workon"],
		[ "building credibility", "workon"],
		[ "finishing projects", "workon"],
		[ "getting training", "workon"],
		[ "giving credit where due", "workon"],
		[ "bringing in more business", "workon"],
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

	sentence_list.each do |attribute_name, category, identifier|
	  Attribute.create!(  attribute_name: attribute_name, 
	                 category: category)
	end
	puts 'ATTRIBUTES'
end