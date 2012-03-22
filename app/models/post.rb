class Post < ActiveRecord::Base
	
  belongs_to :topic
  belongs_to :user
  has_many :forums, :through => :topics
	
 define_index do
    indexes :id
    indexes content
end	
	
end
