class Forum < ActiveRecord::Base
	
  has_many :topics, :dependent=> :destroy
  has_many :users, :through => :topics
  has_many :posts, :through => :topics

		
    define_index do
    indexes :id
    indexes :coname
    indexes description
    indexes topics.content, :as=> :forum_topic
    indexes topics.forum_id, :as=> :forumid
    end
	
 def self.results (search)          
        
        #results = forum_topic.search :conditions=>{:content=>filtervar2}
       
        results=ThinkingSphinx.search  search, :classes => [Post, Topic]    

    
	    return results
 end 
  
  
    
  
  
  
  def most_recent_post
  post=Post.find(:first, :order =>"updated_at DESC", :conditions=>["topic_id=?", self.id])
  return post
  
  end
  
  def number_posts_per_forum     
  
      posts=Topic.find(:all, :conditions=>["forum_id=?", self.id])
      
      j=posts.length-1
      
      a=[]
      
      (0..j).each do |i|
        
        a.push(Post.count(:all, :conditions=>{:topic_id=>posts[i].id}) )
        
      end
      
      return a.sum
      

end















end
