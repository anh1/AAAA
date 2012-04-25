class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :authenticate_user!
  
 def register_company
   if !current_user.nil? && ((@current_user.role_id)==(Role.find_by_role_type("Business").id))
      if current_user.tcom.nil? 
        redirect_to new_tcom_path, :alert => "You must fill Your Company details before proceeding"
      end
   end
 end

end
