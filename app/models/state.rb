class State < ActiveRecord::Base
	#validation
	validates_presence_of :state
end
