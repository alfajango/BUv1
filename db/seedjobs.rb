def seedjobs
	#--------------- Jobs ------------------------------
	jobs = Job.all
	####jobs.delete_all
    initech_id = Company.find_by(name:"In-itech").id
	exampleco_id = Company.find_by(name:"Example").id

	jobs.each do |job|
		if job.author
			if job.author.company
				if (job.author.company.id==initech_id or job.author.company.id==exampleco_id)
	 			  puts "deleting job from #{job.author.name}"
				  job.delete
				end
			end
		else #job had no author, delete it
			puts "job had no author, deleting it"
			job.delete
		end
	end		

	author= User.find_by(name: "Beth Hillman")
	subject=User.find_by(name: "Trevor Carawell")
	job_holder=User.find_by(name: "Jane Williams")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	subject=User.find_by(name: "Jane Williams")
	job_holder=User.find_by(name: "Trevor Carawell")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	subject=User.find_by(name: "Bill Jones")
	job_holder=User.find_by(name: "Phil Garber")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	author= User.find_by(name: "Phil Garber")
	subject=User.find_by(name: "Beth Hillman")
	job_holder=User.find_by(name: "Trevor Carawell")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	author= User.find_by(name: "Phil Garber")
	subject=User.find_by(name: "Beth Hillman")
	job_holder=User.find_by(name: "Jane Williams")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	# same vote from someone else
	author= User.find_by(name: "Bill Jones")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	author= User.find_by(name: "Milton Waddams")
	subject=User.find_by(name: "Peter Gibbons")
	job_holder=User.find_by(name: "Bill Lumbergh")
	job=Job.create!(created: Time.now,
					author: author,
					subject: subject,
					job_holder: job_holder)

	puts "JOBS"
end	