def seedfeedbacks
	#--------------- Feedbacks ------------------------------
	# def make_feedbacks
	feedback = Feedback.all
	feedback.delete_all



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

		["milton@in-itech.com", Attribute.find_by(attribute_name: "difficult to work for"), User.find_by(name: "Bill Lumbergh") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "wrong fit for the company"), User.find_by(name: "Peter Gibbons") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "getting things done"), User.find_by(name: "Samir Nagheenanajar") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "getting the sale"), User.find_by(name: "Michael Bolton") ],
		["milton@in-itech.com", Attribute.find_by(attribute_name: "working independently"), User.find_by(name: "Bill Lumbergh") ],
		["pgibbons@in-itech.com", Attribute.find_by(attribute_name: "confidence"), User.find_by(name: "Milton Waddams") ]		
	    ]

	feedback_list.each do | from_email, attrib_obj, to_user_obj | 

	  #fb = feedback.create!(from_id: from_id, rating_given: 1) 
	  #  runs because when I deleted all, I did feedback = Feedback.all, then feedback.delete_all
	  from_id = User.find_by(email: from_email).id
	  fb = Feedback.create!(from_id: from_id, rating_given: 1)  
	  #puts "3"
	  fb.attribute = attrib_obj
	  # puts "fb.attribute.attribute_name: #{fb.attribute.attribute_name} "
	  to_user_obj.feedbacks << fb
	  #puts "5"
	end
	puts "FEEDBACKS"
end
	# create ratings in crunch_ratings if I want to do those