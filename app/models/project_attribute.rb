class ProjectAttribute
  include Mongoid::Document
  field :name, type: String
  has_many :projects
  has_many :project_ratings
  has_many :project_feedbacks
end
