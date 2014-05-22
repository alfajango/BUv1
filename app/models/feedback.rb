class Feedback
  include Mongoid::Document
  field :from_id, type: String  #ObjectId?  Binary?
  field :rating_given, type: Float
  field :created, type: Time, default: -> { Time.now } 
  field :accounted_for, type: DateTime
  field :category, type: String  # if write-in and there is no attribute
  field :comment, type: String   # if write-in and there is no attribute
  field :visibility, type: String # standard/null, private (good thing that no others see), or public (bad thing that all can see)

  # if a write-in, then populate these two and leave attribute blank
  field :category, type: String
  field :comment, type: String

  belongs_to :user #,  class_name: "User", inverse_of: :feedbacks
  belongs_to :attribute
  has_many :fbvotes

  embeds_many :thanks
  embeds_many :asks
  embeds_many :flags

  def self.for_company(co)
    where("user.company = ?", co)
  end
  #has_one :attribute #, class_name: "Attribute", inverse_of: :feedbacks # feedback singular? # putting this in prevents fb.attribute = attrib  from working
end

