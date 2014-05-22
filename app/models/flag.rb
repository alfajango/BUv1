class Flag
  include Mongoid::Document
  field :created, type: Time, default: -> { Time.now }
end
