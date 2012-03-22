class Comment < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :commenter, :class_name => "User"
  
  #delegate :commenter
  
   
end
