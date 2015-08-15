require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
	def setup
		@provider = Provider.new
	end 

	test "the truth" do 
		assert true
	end 

	test "it should get index page" do 
		get :index 
		assert_response :success
		assert_not_nil assigns(:providers)
	end 
end 
