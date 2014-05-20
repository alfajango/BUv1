def seedjobs
	#--------------- Jobs ------------------------------
	jobs = Job.all
	jobs.delete_all

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