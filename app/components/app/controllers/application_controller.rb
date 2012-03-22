class ApplicationController < ActionController::Base
  helper :all

  before_filter :fetch_logged_in_user
  before_filter :login_required  

  def redirect_now 
    render :nothing
  end

  protected

  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find(session[:user_id])
  end

  def logged_in?
    ! @current_user.nil?
  end

  helper_method :logged_in?

  # This will redirect not logged in user to login page from any part
  # of an application, except login page itself, and session store
  # controller.
  def login_required
    logger.info [ "CLASS", self.class]
    return true if logged_in?
    session[:return_to] = request.request_uri
    redirect_to new_session_path and return false unless 
      self.is_a?(HomesController) or
      self.is_a?(SessionsController)
  end



end
