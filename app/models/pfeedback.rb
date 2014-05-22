class Pfeedback
  include Mongoid::Document
  #field :attrib, type: String
  field :from_id, type: String
  field :rating_given, type: Float  # get rid of ?
  field :created, type: Time, default: -> { Time.now } 
  field :accounted_for, type: Time  # get rid of ?
  belongs_to :project  # which project it's talking about
  belongs_to :pattribute
  has_many :fbvotes
  
  # if a write-in, then populate these two and leave attribute blank
  field :category, type: String
  field :comment, type: String


end
