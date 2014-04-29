class Pattribute
  include Mongoid::Document
  field :name, type: String
  field :identifier, type: Integer
  field :category, type: String
  field :created, type: Time, default: -> { Time.now } 
  has_many :pfeedbacks
end
