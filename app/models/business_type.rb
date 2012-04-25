class BusinessType < ActiveRecord::Base
	has_many :tcoms
  validates_presence_of :business_type
end
