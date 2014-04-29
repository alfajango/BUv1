class Vote
  include Mongoid::Document
  field :value, type: Integer
  field :created, type: Time, default: -> { Time.now }
  belongs_to :idea
  belongs_to :user
end
