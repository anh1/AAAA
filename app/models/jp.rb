class Jp < ActiveRecord::Base
	has_many :tcs
	belongs_to :fedbiz
end
