class Attribute
  include Mongoid::Document
  field :attribute_name, type: String
  field :category, type: String # posattrib, constructive, alert 
  field :identifier, type: Integer
  #has_many :users
  belongs_to :feedback , class_name: "Feedback", inverse_of: :attribute # needed?
end
