class Provider < ActiveRecord::Base
  validates :name, :firstlineaddress, :citystatezip, presence: true 
end
