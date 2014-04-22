class Pattribute
  include Mongoid::Document
  field :name, type: String
  field :identifier, type: Integer
  field :category, type: String
  has_many :pfeedbacks
end
