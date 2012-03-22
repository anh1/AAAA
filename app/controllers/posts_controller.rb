class PostsController < ApplicationController
     before_filter :login_required, :only => [ :new, :create]
  
  def new
   @post = Post.new
  end
  def create
     @post = Post.new(params[:post])    
     @post= @current_user.posts.build params[:post]      
     @post.save         
     
    
     redirect_to "/topics/#{@post.topic_id}"
     
     
   end
end
