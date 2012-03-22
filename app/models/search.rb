class Search < ActiveRecord::Base
has_many :topics
has_many :posts
has_many :forums
has_many :users

	
	
end
