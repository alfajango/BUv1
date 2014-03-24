class ProjectFeedback
  include Mongoid::Document
  field :from_id , type: String #ObjectId?  # my id's are no longer integers
  field :attribute, type: String
  #field :to_project_id, type: Integer
  #field :project_attribute_identifier, type: Integer
  field :rating_given, type: Float
  field :accounted_for, type: DateTime
  #belongs_to :user
  belongs_to :project
end
