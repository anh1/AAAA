class User < ActiveRecord::Base
  before_create :build_inbox
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :username, :state, :role_id  
   
  #Associations   
  belongs_to :role
  has_many :topics
  has_many :posts
  has_many :forums, :through => :topics
  has_one :tcom

  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders
    
  has_many :blog_comments, :class_name => "Comment", :foreign_key => "commenter_id"
  has_many :blogs, :class_name => "BlogPost", :foreign_key=> "blogger_id"

  #find the name Inbox
  def inbox
    folders.find_by_name("Inbox")
  end

  #Generate the folder name Inbox for the individual user.
  def build_inbox
    folders.build(:name => "Inbox")
  end
  
  #select all the state from State table.
	def self.state_all
		State.all.map(&:state)
	end

  #send the confirmation instruction mail for creating the user using delayed job.
  def send_on_create_confirmation_instructions
    Devise::Mailer.delay.confirmation_instructions(self)
  end
  #send the confirmation instruction mail using delayed job.
  def send_confirmation_instructions
    Devise::Mailer.delay.confirmation_instructions(self)
  end
  
  #send the reset password instruction mail using delayed job.
  def send_reset_password_instructions
    Devise::Mailer.delay.reset_password_instructions(self)
  end
  
  #validation for User table fields.
  validates_presence_of :firstname, :username, :state, :lastname
  validates :firstname, :lastname, :length => { :minimum => 4 }
  validates :username, :length => { :in => 6..20 }
  
end
