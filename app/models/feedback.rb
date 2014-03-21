class Feedback
  include Mongoid::Document
  field :from_id, type: Integer
  #field :to_id, type: Integer
  #field :attribute_identifier, type: String
  field :rating_given, type: Float
  field :accounted_for, type: DateTime
  belongs_to :user
  belongs_to :attribute
end

