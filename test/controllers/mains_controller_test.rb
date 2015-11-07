require 'test_helper'

class MainsControllerTest < ActionController::TestCase
	def setup 
		sign_in users(:one)

	end 

	
	test "should get index" do 
		get :index 
		assert_response :success 
	end 

	test "should get new" do 
		get :new
		assert_response :success 
	end 

	test 'should redirect on create' do
		post :create, {"providers"=>"1",
 "attorneys"=>"1",
 "n1"=>"",
 "n2"=>"",
 "employee"=>"",
 "employer"=>"",
 "docket"=>"",
 "returndate"=>"",
 "todaysdate"=>""}
		assert_response :success 
	end 
end
