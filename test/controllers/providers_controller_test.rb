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

	test "it should get a new template" do 
		get :new 
		assert_response :success
	end 

	test "it should create a new provider" do 
		assert_difference('Provider.count') do 
			post :create, provider: { 
				name: "foo", 
				firstlineaddress: "100 Baz Lane",
				citystatezip: "foobar, FB 60606" 
			}
			assert_redirected_to providers_path
		end 
	end 
end 
