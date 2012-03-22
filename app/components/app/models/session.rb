class Session < ActiveRecord::Base
	
before_create :build_inbox

  def inbox
    folders.find_by_name("Inbox")
  end

  def build_inbox
    folders.build(:name => "Inbox")
  end
  
end
