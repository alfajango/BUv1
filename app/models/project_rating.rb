class ProjectRating
  include Mongoid::Document
  #field :project_id, type: Integer
  #field :project_attribute_identifier, type: Integer
  field :attribute, type: String
  field :current_rating, type: Float
  field :num_fb_received, type: Float
  belongs_to :project
end
