class UserSessionsController < ApplicationController
  


  def new
    @current_user = UserSession.new    
  end


  def create

@current_user= UserSession.new(params[:user_session])

   
 if @current_user.save
        flash[:notice] = "Sucessfully logged in."
	redirect_to root_url
      else
        render :action => 'new'
      end



end
 


  def destroy
    @current_user = UserSession.find
    @current_user.destroy

      flash[:notice]= "Successfully logged out."
      redirect_to root_url      

end
end
