class ProjectAttribute
  include Mongoid::Document
  field :name, type: String
  has_and_belongs_to_many :projects
  has_many :project_ratings
  has_many :project_feedbacks
end
