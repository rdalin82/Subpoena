require 'test_helper'

class AttorneyTest < ActiveSupport::TestCase
  describe Attorney do 
    let(:attorney) {Attorney.new} 
    let(:attorney1) { Attorney.create!(name: "Laura Hartin", address: "100 W. Randolph Chicago, IL 60601", phone: "312-814-1442")}
     it "should not save blank attorney" do 
       refute attorney.save
     end  
    it "should save with valid name, address, phone" do 
      assert attorney1.save 
    end
  end 
end
