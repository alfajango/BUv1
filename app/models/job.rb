class Job
  include Mongoid::Document
  field :created, type: Time
  belongs_to :author, class_name: 'User', :inverse_of => :opinions
  belongs_to :subject, class_name: 'User', :inverse_of => :target_users
  belongs_to :job_holder, class_name: 'User', :inverse_of => :target_jobs
end
