class ProjectFeedback
  include Mongoid::Document
  #field :from_id, type: Integer
  #field :to_project_id, type: Integer
  #field :project_attribute_identifier, type: Integer
  field :rating_given, type: Float
  field :accounted_for, type: DateTime
  belongs_to :user
  belongs_to :project
  belongs_to :project_attribute
end
