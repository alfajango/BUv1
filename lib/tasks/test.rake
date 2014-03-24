# run with $ rake db:run_debug_code

namespace :db do
  desc "a few lines to debug"
  task run_debug_code: :environment do
    test1
    

  end
end


def test1

	project_feedback_list = [ # from_id, attribute, rating_given, project object
		[1, "Execution", 8, Project.find_by(name: "Acquire competitors") ]  #,
		# [1, "Strategy", 7, Project.find_by(name: "Acquire competitors") ],
		# [1, "Execution", 6, Project.find_by(name: "Factory cost reduction") ],
		# [1, "Strategy", 5, Project.find_by(name: "Factory cost reduction") ],
		# [1, "Execution", 10, Project.find_by(name: "Refresh website") ],
		# [1, "Strategy", 9, Project.find_by(name: "Refresh website") ],
		# [2, "Execution", 10, Project.find_by(name: "Acquire competitors") ],
		# [2, "Strategy", 9, Project.find_by(name: "Acquire competitors") ],
		# [2, "Execution", 8, Project.find_by(name: "Factory cost reduction") ],
		# [2, "Strategy", 7, Project.find_by(name: "Factory cost reduction") ],
		# [2, "Execution", 6, Project.find_by(name: "Refresh website") ],
		# [2, "Strategy", 5, Project.find_by(name: "Refresh website") ],
		# [3, "Execution", 1, Project.find_by(name: "Acquire competitors") ],
		# [3, "Strategy", 2, Project.find_by(name: "Acquire competitors") ],
		# [3, "Execution", 3, Project.find_by(name: "Factory cost reduction") ],
		# [3, "Strategy", 4, Project.find_by(name: "Factory cost reduction") ],
		# [3, "Execution", 5, Project.find_by(name: "Refresh website") ],
		# [3, "Strategy", 6, Project.find_by(name: "Refresh website") ]
	    ]
	puts "a1"

	#project_feedback_list.each do | from_id, attribute, rating_given, project | 
	  puts "a2"
	  puts "User.first.id: #{User.first.id}"
	  pfb = Pfeedback.create
	#pfb = ProjectFeedback.create!(from_id: User.first.id, attribute: "Execution", rating_given: 8)	
	#  pfb = ProjectFeedback.create!(from_id: from_id, attribute: attribute, rating_given: rating_given)
	  #projfb = pfb.create!(from_id: from_id, attribute: attribute, rating_given: rating_given)
	  # try pfb = project_feedback.create 
	  puts "a3"
	 # project.project_feedbacks << pfb
	  puts "a4"
	#end

end # test1	