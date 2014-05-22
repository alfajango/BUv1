class Ask
  include Mongoid::Document
  field :created, type: Time, default: -> { Time.now }
  field :ask_text, type: String
  field :emailed, type: Time
  field :replied, type: Time
  field :reply_text, type: String

  embedded_in :feedback

end
