class Project
  include Mongoid::Document
  field :name, type: String
  belongs_to :user  # store this so we can put the creator's name, and so we know who can edit/delete
  #field :company_id, type: Integer
  belongs_to :company
  #has_many :project_feedbacks
  has_many :pfeedbacks
  # has_many :project_ratings

  # todo: set permissions here?
end
