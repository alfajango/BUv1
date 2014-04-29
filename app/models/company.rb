class Company
  include Mongoid::Document
  field :domain, type: String
  field :name, type: String
  field :created, type: Time, default: -> { Time.now } 
  has_many :projects
  has_many :users  #, class_name: "User", inverse_of: :company 
  has_many :ideas
end
