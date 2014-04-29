class Project
  include Mongoid::Document
  field :name, type: String
  	validates :name, presence: true, length: { maximum: 150 } #, uniqueness: { case_sensitive: false } # need to find a way 
       # to make this unique only within a given company
  field :created, type: Time, default: -> { Time.now } 
  belongs_to :user  # store this so we can put the creator's name, and so we know who can edit/delete
  #field :company_id, type: Integer
  belongs_to :company
  #has_many :project_feedbacks
  has_many :pfeedbacks
  # has_many :project_ratings

  # todo: set permissions here?
end
