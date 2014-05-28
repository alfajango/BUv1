class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # include DeviseInvitable::Inviter ## per https://bountify.co/get-skeleton-of-working-devise_invitable-example
  belongs_to :company  #, class_name: "Company", inverse_of: :user 
  has_many :feedbacks #,  class_name: "Feedback", inverse_of: :user #( feedback this person has received )
  has_many :projects
  has_many :ideas
  has_many :votes
  has_many :fbvotes
  has_many :opinions, class_name: "Job", :inverse_of => :author
  has_many :target_users, class_name: "Job", :inverse_of => :subject
  has_many :target_jobs, class_name: "Job", :inverse_of => :job_holder



  # don't think I also need this:
  # field :company_id         :type => Integer, :default => 0  # will be example or something seeded

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


  devise :invitable, :database_authenticatable, :registerable, #  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :invitable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })
  field :name, :type => String
  validates_presence_of :name
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :created_at, :updated_at

  ## Invitable (devise_invitable gem)
  field :invitation_token, type: String
  field :invitation_created_at, type: Time
  field :invitation_sent_at, type: Time
  field :invitation_accepted_at, type: Time
  field :invitation_limit, type: Integer

  index( {invitation_token: 1}, {:background => true} )
  index( {invitation_by_id: 1}, {:background => true} )
end
