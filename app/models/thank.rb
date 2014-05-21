class Thank
  include Mongoid::Document
  field :created, type: Time, default -> { Time.now }
  embedded_in :feedback
end
