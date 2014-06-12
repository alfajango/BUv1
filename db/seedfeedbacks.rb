def seedfeedbacks
	#--------------- Feedbacks ------------------------------
	
    initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id

	feedback = Feedback.all
	feedback.each do |fb|
		if fb.user
			if fb.user.company
  				if (fb.user.company.id==initech_id or fb.user.company.id==exampleco_id)
	 			  puts "deleting a fb for #{fb.user.name}"
				  fb.delete
				end
			end
		else
		    puts "fb had no user, deleting it"
		    fb.delete	
		end
	end		
	### feedback.delete_all   # don't do this - it will get rid of real users' feedback!



	feedback_list = [ # from_email, attribute object, to_user object
		["tcarawell@example.com", Attribute.find_by(attribute_name: "for the time"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "giving credit where due"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "leadership"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "meeting the deadline"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "helping the team"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a bonus"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Bill Jones") ],		 
		["tcarawell@example.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Bill Jones") ],		
		["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "staying on task"), User.find_by(name: "Bill Jones") ],		 
		["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "passion"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Jane Williams") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "working efficiently"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "passion"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Bill Jones") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Phil Garber") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Phil Garber") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Phil Garber") ],
		["tcarawell@example.com", Attribute.find_by(attribute_name: "closing the deal"), User.find_by(name: "Beth Hillman") ],

		["milton@in-itech.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Bill Lumbergh") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "poor management"), User.find_by(name: "Bill Lumbergh") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "building rapport"), User.find_by(name: "Bill Lumbergh") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "wrong fit for the company"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "accuracy"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "work ethic"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "staying on task"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Samir Nagheenanajar") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "helping the team"), User.find_by(name: "Samir Nagheenanajar") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "attitude"), User.find_by(name: "Samir Nagheenanajar") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Samir Nagheenanajar") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Michael Bolton") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "high quality work"), User.find_by(name: "Michael Bolton") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "deserves a promotion"), User.find_by(name: "Michael Bolton") ],
		["pgibbons@in-itech.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Milton Waddams") ],
		["pgibbons@in-itech.com", Attribute.find_by(attribute_name: "high quality work"), User.find_by(name: "Milton Waddams") ],
		["pgibbons@in-itech.com", Attribute.find_by(attribute_name: "meeting the deadline"), User.find_by(name: "Milton Waddams") ]				
	    ]

	feedback_list.each do | from_email, attrib_obj, to_user_obj | 

	  from_id = User.find_by(email: from_email).id
	  fb = Feedback.create!(from_id: from_id, rating_given: 1)  
	  fb.attribute = attrib_obj
	  to_user_obj.feedbacks << fb
	end
	puts "FEEDBACKS"
end
	# create ratings in crunch_ratings if I want to do those