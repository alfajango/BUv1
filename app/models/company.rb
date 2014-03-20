class Company
  include Mongoid::Document
  field :domain, type: String
  field :name, type: String
  has_many :projects
end
