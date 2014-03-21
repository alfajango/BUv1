class Attribute
  include Mongoid::Document
  field :attribute_name, type: String
  field :category, type: String
  field :identifier, type: Integer
  has_many :users
  has_many :feedbacks
end
