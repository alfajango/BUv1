def seedpfeedbacks
	#--------------- Pfeedbacks ------------------------------
	pfb = Pfeedback.all
	#puts "pfb.size: #{pfb.size}"
	pfb.delete_all

	pfeedback_list = [ # from_email, pattribute object, to_project object
		["tcarawell@example.com", Pattribute.find_by(name: "is important for the company"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs to pivot"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs additional team"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs more funding"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Acquire competitors") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs different leadership"), Project.find_by(name: "Acquire competitors") ],

		["tcarawell@example.com", Pattribute.find_by(name: "needs more time"), Project.find_by(name: "Factory cost reduction") ],
		["tcarawell@example.com", Pattribute.find_by(name: "is important for the company"), Project.find_by(name: "Factory cost reduction") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs different resources"), Project.find_by(name: "Factory cost reduction") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Factory cost reduction") ],
		["tcarawell@example.com", Pattribute.find_by(name: "is going great"), Project.find_by(name: "Factory cost reduction") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs additional team"), Project.find_by(name: "Factory cost reduction") ],

		["tcarawell@example.com", Pattribute.find_by(name: "needs different resources"), Project.find_by(name: "Refresh website") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Refresh website") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs more time"), Project.find_by(name: "Refresh website") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Refresh website") ],
		["tcarawell@example.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "Refresh website") ],

		["milton@in-itech.com", Pattribute.find_by(name: "needs to be rescoped"), Project.find_by(name: "Think: Is this good for the company?") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs a different team"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs to show market need"), Project.find_by(name: "New printer") ]
	    ]

	pfeedback_list.each do | from_email, pattrib_obj, to_proj_obj | 

	  #fb = feedback.create!(from_id: from_id, rating_given: 1) 
	  #  runs because when I deleted all, I did feedback = Feedback.all, then feedback.delete_all
	  from_id = User.find_by(email: from_email).id
	  pfb = Pfeedback.create!(from_id: from_id, rating_given: 1)  
	  #puts "3"
	  pfb.pattribute = pattrib_obj
	  # puts "fb.attribute.attribute_name: #{fb.attribute.attribute_name} "
	  to_proj_obj.pfeedbacks << pfb
	  #puts "5"
	end
	puts "PFEEDBACKS"

end