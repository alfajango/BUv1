class Fbvote
  include Mongoid::Document
  field :upvote, type: Integer, default: -> { 0 }
  field :downvote, type: Integer, default: -> { 0 }
  field :created, type: Time, default: -> { Time.now }
  
  # CLEANUP: See note in Vote model, could combine these as a polymorphic association or embedded document
  belongs_to :feedback
  belongs_to :pfeedback  # either feedback or pfeedback.  Is this ok?

  belongs_to :user # default to current_user ?
end
