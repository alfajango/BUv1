class Project
  include Mongoid::Document
  field :name, type: String
  field :creator, type: String  # store the first and last name of the creator
  #field :company_id, type: Integer
  belongs_to :company
  #has_many :project_feedbacks
  has_many :pfeedbacks
  # has_many :project_ratings

  # todo: set permissions here?
end
