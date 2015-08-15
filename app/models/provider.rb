class Provider < ActiveRecord::Base
	validates :name, :firstlineaddress, :secondlineaddress, :citystatezip, presence: true 
end
