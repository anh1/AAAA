class MessagesController < ApplicationController
    layout "mailbox"
  
  def show
    @message = @current_user.received_messages.find(params[:id])
  
 render :update do |page| 
  page.replace_html "message", :partial => "receivedmessage" 
 end 


    
  end
  
  def destroy
    @message = @current_user.received_messages.find(params[:id])
    @message.update_attribute("deleted", true)
    redirect_to mailInbox_path
  end
  
  def undelete
    @message = @current_user.received_messages.find(params[:id])
    @message.update_attribute("deleted", false)
    redirect_to mailInbox_path
  end
  
  def reply
    @original = @current_user.received_messages.find(params[:id])    
    subject = @original.subject.sub(/^(Re: )?/, "Re: ")
    body = @original.body.gsub(/^/, "> ")
    @message = @current_user.sent_messages.build(:to => [], :subject => subject, :body => body)
   # render :template => "sent/new
  end
  
  def forward
    @original = @current_user.received_messages.find(params[:id])    
    subject = @original.subject.sub(/^(Fwd: )?/, "Fwd: ")
    body = @original.body.gsub(/^/, "> ")
    @message = @current_user.sent_messages.build(:subject => subject, :body => body)
    render :template => "sent/new"
  end
  
  def reply_all
    @original = @current_user.received_messages.find(params[:id])
    
    subject = @original.subject.sub(/^(Re: )?/, "Re: ")
    body = @original.body.gsub(/^/, "> ")
    recipientsc = @original.recipients.map(&:login) - [@current_user.login] + [@original.author.login] 
    @recipients = recipientsc.join(";") 
    @message = @current_user.sent_messages.build(:to =>[], :subject => subject, :body => body)
   # render :template => "sent/new"
  end
end
