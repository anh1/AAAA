class MailboxController < ApplicationController
layout "mailbox"
	
  def mailList
     #@captialize_company_name=@current_user.coname.upcase
   
   end 
  
   	  
  
  def index
    redirect_to new_session_path and return unless logged_in?
    @folder = @current_user.inbox
    show
    render :action => "show"
  end

  def show
    @folder ||= @current_user.folders.find(params[:id])
    @not_deleted=@folder.messages.where(["deleted IS NULL OR deleted = ?", false])
    @messages=@not_deleted.paginate(:page => params[:page],:per_page => 10, :page => params[:page], :include => :message, :order => "messages.created_at DESC")
  
 def trash
    @folder = Struct.new(:name, :user_id).new("Trash", @current_user.id)
    @deleted = @current_user.received_messages.where(["deleted IS NULL OR deleted = ?", true])
    @messages = @deleted.paginate(:page => params[:page],:per_page => 10, :page => params[:page], :include => :message, :order => "messages.created_at DESC")
    render :action => "show"
  end

end
