def seedpfeedbacks
	#--------------- Pfeedbacks ------------------------------
    initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id

	pfeedback = Pfeedback.all
	pfeedback.each do |pfb|
		if pfb.project
			if pfb.project.company
  				if (pfb.project.company.id==initech_id or pfb.project.company.id==exampleco_id)
	 			  puts "deleting a pfb for #{pfb.project.name}"
				  pfb.delete
				end
			end
		else
			puts "pfb had no project, deleting it"
			pfb.delete	
		end
	end	
	# ###pfb = Pfeedback.all
	# ###pfb.delete_all

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

		["milton@in-itech.com", Pattribute.find_by(name: "is critical for our customers"), Project.find_by(name: "Think: Is this good for the company?") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs to be de-priorized"), Project.find_by(name: "Think: Is this good for the company?") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs more time"), Project.find_by(name: "Think: Is this good for the company?") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs to pivot"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "is important for the company"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "is going well"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs to pivot"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs to be cancelled"), Project.find_by(name: "Office Supply cost reduction") ],
		["milton@in-itech.com", Pattribute.find_by(name: "is critical for the company"), Project.find_by(name: "New printer") ],
		["milton@in-itech.com", Pattribute.find_by(name: "is doing poorly"), Project.find_by(name: "New printer") ],
		["milton@in-itech.com", Pattribute.find_by(name: "needs more funding"), Project.find_by(name: "New printer") ],
		["milton@in-itech.com", Pattribute.find_by(name: "progress is too slow"), Project.find_by(name: "New printer") ]
	    ]

	pfeedback_list.each do | from_email, pattrib_obj, to_proj_obj | 

	  #from_id = User.find_by(email: from_email).id
	  #pfb = Pfeedback.create!(from_id: from_id, rating_given: 1, pattribute_id: pattrib_obj.id, project_id: to_proj_obj.id)  
	  
	  from_id = User.find_by(email: from_email).id
	  pfb = Pfeedback.create!(from_id: from_id, rating_given: 1, pattribute: pattrib_obj, project: to_proj_obj)  
	  # pfb.pattribute = pattrib_obj
	  # to_proj_obj.pfeedbacks << pfb

	end
	puts "PFEEDBACKS"

end