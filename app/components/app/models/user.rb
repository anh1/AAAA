class User < ActiveRecord::Base


  belongs_to :role
	
  has_many :topics
  has_many :posts
  has_many :forums, :through => :topics
  
  has_one :tcom
  
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders
    
 has_many :blog_comments, :class_name => "Comment", :foreign_key => "commenter_id"
 has_many :blogs, :class_name => "BlogPost", :foreign_key=> "blogger_id"
  
  

before_create :build_inbox


  def inbox
    folders.find_by_name("Inbox")
  end

  def build_inbox
    folders.build(:name => "Inbox")
  end
  


	
end
