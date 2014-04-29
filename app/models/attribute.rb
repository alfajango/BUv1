class Attribute
  include Mongoid::Document
  field :attribute_name, type: String
  field :category, type: String # positive, constructive, alert 
  field :identifier, type: Integer
  field :created, type: Time, default: -> { Time.now } 
  #has_many :users
  has_many :feedback #, class_name: "Feedback", inverse_of: :attribute # needed?
end
