class Feedback
  include Mongoid::Document
  field :from_id, type: String  #ObjectId?  Binary?
  #field :to_id, type: Integer
  #field :attribute_identifier, type: String
  field :rating_given, type: Float
  field :created, type: Time, default: -> { Time.now } 
  field :accounted_for, type: DateTime

  # if a write-in, then populate these two and leave attribute blank
  field :category, type: String
  field :comment, type: String

  belongs_to :user #,  class_name: "User", inverse_of: :feedbacks
  belongs_to :attribute

  def self.for_company(co)
    where("user.company = ?", co)
  end
  #has_one :attribute #, class_name: "Attribute", inverse_of: :feedbacks # feedback singular? # putting this in prevents fb.attribute = attrib  from working
end

