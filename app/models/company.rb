class Company
  include Mongoid::Document
  field :domain, type: String
  field :name, type: String
  has_many :projects
  has_many :users  #, class_name: "User", inverse_of: :company 
end
