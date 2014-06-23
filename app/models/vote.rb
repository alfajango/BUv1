class Vote
  include Mongoid::Document
  field :upvote, type: Integer, default: -> { 0 }
  field :downvote, type: Integer, default: -> { 0 }
  field :created, type: Time, default: -> { Time.now }
  # CLEANUP: Might work better to have a vote either:
  #   * belong to a polymorphic association, which could be an idea, feedback, or pfeedback
  #   * be an embedded document in an idea, feedback, or pfeedback
  belongs_to :idea
  belongs_to :user # default to current_user ?
end
