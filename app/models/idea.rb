class Idea
  include Mongoid::Document
  field :body, type: String
  field :created, type: Time, default: -> { Time.now }  # should this be DateTime?
  belongs_to :user
  belongs_to :company
  belongs_to :thread, :class_name => 'Idea'  # Reference to parent message
  has_many :replies,  :class_name => 'Idea', :foreign_key => 'thread_id' #(?)
  has_many :votes
  # ? # named_scope :in_reply_to, lambda { |idea| :conditions => {:thread => idea}, :order => 'created_at' }

end
