class Topic < ActiveRecord::Base

  belongs_to :forum
  belongs_to :user
  has_many :posts, :dependent=> :destroy
  
   define_index do
    indexes :id
    indexes :coname
    indexes content
end	
  
  
  def most_recent_post
  post=Post.first(:order =>"updated_at DESC", :conditions=>['topic_id=?', self.id])
  return post
  end
	
end
