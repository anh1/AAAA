class BlogPost < ActiveRecord::Base
	has_many :comments
	belongs_to :blogger, :class_name => "User"
	
	
end
