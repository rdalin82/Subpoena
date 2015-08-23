require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

	describe Provider do 
		let(:provider) {Provider.new} 
		let(:provider1) {Provider.create(name: "Some Janky Hospital", firstlineaddress: "100 Take all your money Lane", citystatezip: "South Chicago, IL 60606")}

		it "should not save a blank provider" do 
			refute provider.save 
		end 

		it "should save a valid provider" do 
			assert provider1.save 
		end 
	end 
end
