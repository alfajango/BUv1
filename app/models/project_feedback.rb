# class ProjectFeedback
#   include Mongoid::Document
#   field :from_id , type: String #ObjectId?  # my id's are no longer integers
#   field :attribute, type: String
#   field :rating_given, type: Float
#   field :accounted_for, type: DateTime
#   belongs_to :project
# end
