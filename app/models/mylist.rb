class Mylist < ActiveRecord::Base
	has_many :tcomsfedbizs, :dependent=> :destroy
	belongs_to :user
end
