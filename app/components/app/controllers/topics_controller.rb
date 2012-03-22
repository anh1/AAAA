class TopicsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create]
  
  def index
  end
   
   def new      
      @topic=Topic.new      
    end 
   
   def create
     
     @topic= @current_user.topics.build(params[:topic])
     @topic.save    
     redirect_to "/forums/#{@topic.forum_id}"     
  
   end
   
  def show
   @topic=Topic.find(params[:id])
  end


end
