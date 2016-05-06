require 'test_helper'

class MainsControllerTest < ActionController::TestCase
  def setup 
    sign_in users(:one)
    Provider.create!(id: 0, name: 'name', firstlineaddress: '123 Address', citystatezip: 'Chicago, IL 60601')
  end 
  test "should get index" do 
    get :index 
    assert_response :success 
  end 

  test "should get new" do 
    get :new
    assert_response :success 
  end 
end
