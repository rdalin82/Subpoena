require 'test_helper'

describe SubpoenaParser do 
  let (:subpoena_fake) { SubpoenaParser.new('yo', {:provider => 'provider', :attorney => 'attorney'}) }
  let (:subpoena2) { SubponeaParser.new('yo') }
  it "should not have a problem" do 
    assert :subpoena_fake
  end 
end