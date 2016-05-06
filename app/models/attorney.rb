class Attorney < ActiveRecord::Base
  validates :name, :address, :phone, presence: true
end
