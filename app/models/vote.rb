class Vote
  include Mongoid::Document
  field :upvote, type: Integer, default: -> { 0 }
  field :downvote, type: Integer, default: -> { 0 }
  field :created, type: Time, default: -> { Time.now }
  belongs_to :idea
  belongs_to :user # default to current_user ?
end
