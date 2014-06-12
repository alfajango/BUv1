def seedpattributes
	#--------------- Pattributes ------------------------------

	# name, category, identifier

	pattribute_list = [
		["is important for the company", "positive"],
		["is important for our customers", "positive"],
		["is critical for the company", "positive"],
		["is critical for our customers", "positive"],
		["is unnecessary for the company", "negative"],
		["is unnecessary for our customers", "negative"],
		["is going well", "positive"],
		["is going great", "positive"],
		["is doing poorly", "negative"],
		["progress is too slow", "negative"],
		["could be doing better", "negative"],
		["needs to be prioritized", "needs"],
		["needs to be de-priorized", "needs"],
		["needs to be rescoped", "needs"],
		["needs to be cancelled", "needs"],
		["needs to show progress", "needs"],
		["needs to show market need", "needs"],
		["needs to pivot", "needs"],
		["needs more funding", "needs"],
		["needs more resources", "needs"],
		["needs more time", "needs"],
		["needs more visiblility", "needs"],
		["needs more support from management", "needs"],
		["needs less funding", "needs"],
		["needs a fresh start", "needs"],
		["needs different resources", "needs"],
		["needs different leadership", "needs"],
		["needs a different team", "needs"],
		["needs additional resources", "needs"],
		["needs additional resources", "needs"],
		["needs additional team", "needs"]
	]

	pattrib = Pattribute.all
	pattrib.delete_all
	
	pattribute_list.each do | name, category |
	  Pattribute.create!(  name: name, category: category )
	end
	puts 'PATTRIBUTES'

end