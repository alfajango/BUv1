class Pfeedback
  include Mongoid::Document
  #field :attrib, type: String
  field :from_id, type: String
  field :rating_given, type: Float
  field :created, type: Time, default: -> { Time.now } 
  field :accounted_for, type: Time  # should it be DateTime
  belongs_to :project  # which project it's talking about
  belongs_to :pattribute
end
