class Notifier < ActionMailer::Base
  default :from => "nethaji@railsfactory.org"
  
  def registration_email(tcom)
    @tcom = tcom
    mail(:to => tcom.business_email, :subject => "Welcome to Small Business Teaming Network")
  end
  
  def contact_us_email(contact)
    @contact=contact
    mail(:to => "nethaji@railsfactory.org", :subject => "ContactUs information")
  end
  
end
