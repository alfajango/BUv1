def seedpattributes
	#--------------- Pattributes ------------------------------
	# def make_attributes
	pattrib = Pattribute.all
	pattrib.delete_all

	# name, category, identifier
	# just do name - and so it seems like the syntax is no brackets

	pattribute_list = [
		"is important for the company" ,
		"is important for our customers",
		"is critical for the company",
		"is critical for our customers",
		"is unnecessary for the company",
		"is unnecessary for our customers",
		"is going well",
		"is going great",
		"is doing poorly",
		"could be doing better",
		"needs to be prioritized",
		"needs to be de-priorized",
		"needs to be rescoped",
		"needs to be cancelled",
		"needs to show progress",
		"needs to show market need",
		"needs to pivot",
		"needs more funding",
		"needs more resources",
		"needs more time",
		"needs more visiblility",
		"needs more support from management",
		"needs less funding",
		"needs a fresh start",
		"needs different resources",
		"needs different leadership",
		"needs a different team",
		"needs additional resources",
		"needs additional resources",
		"needs additional team"
	]


	pattribute_list.each do | name |
	  Pattribute.create!(  name: name )
	end
	puts 'PATTRIBUTES'

end