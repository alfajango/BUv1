class Feedback
  include Mongoid::Document
  field :from_id, type: String  #ObjectId?  Binary?
  #field :to_id, type: Integer
  #field :attribute_identifier, type: String
  field :rating_given, type: Float
  field :accounted_for, type: DateTime
  belongs_to :user #,  class_name: "User", inverse_of: :feedbacks
  has_one :attribute #, class_name: "Attribute", inverse_of: :feedbacks # feedback singular? # putting this in prevents fb.attribute = attrib  from working
end

