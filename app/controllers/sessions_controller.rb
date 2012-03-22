class SessionsController < ApplicationController
#before_filter :login_required, :only => [ :new, :create]

 
  def new
    
  end



  def create
   #@current_user = User.where(:login=>params[:login], :password=>params[:password])[0]
@current_user = User.find_by_login_and_password(params[:login], params[:password])

 if @current_user
session[:user_id] = @current_user.id          
	   redirect_to  :root	   
      else
         render :action => "new"       
	 
	 

    end
  end

def destroy
session[:user_id] = @current_user = nil
end


end
