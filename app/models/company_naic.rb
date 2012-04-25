class CompanyNaic < ActiveRecord::Base
	#Associations 
	belongs_to :tcom
	#validations
	validates_presence_of :name
end
