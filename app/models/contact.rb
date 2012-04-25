class Contact < ActiveRecord::Base
	#validations
	validates_presence_of :name, :company_name, :email, :mobile_number, :subject, :description
	validates_numericality_of :mobile_number
	validates :description, :length => {:in=>20..200}
end
