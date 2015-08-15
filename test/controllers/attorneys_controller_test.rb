require 'test_helper'

class AttorneysControllerTest < ActionController::TestCase
	def setup
		@attorney = attorneys(:one)
	end 

   test "the truth" do
     assert true
   end

   test "should get index" do 
   	get :index
   	assert_response :success
   	assert_not_nil assigns(:attorneys)
   end

   test "should get individual id" do 
   	get :show, id: @attorney.id
   	assert_response :success
   end 

   test "should get new template" do 
   	get :new
   	assert_response :success 
   end 

   test "should create new attorney" do 
   	assert_difference('Attorney.count') do 
   		post :create, attorney: {
   			name: 'Laura Hartin',
   			address: '100 W. Randolph Street 13th Floor, Chicago, IL 60601',
   			phone: '312-814-3678'
   		}
   		assert_redirected_to attorneys_path
   	end 
   end
   test "should get edit page" do 
   	get :edit, id: @attorney
   	assert_response :success
   end 

   test "should update article" do 
   	patch :update, id: @attorney.id, attorney: {
   		fax: "312-814-1154"
   	}
   	assert_redirected_to attorneys_path
   end 

   test "should destroy new attorney" do 
   	assert_difference('Attorney.count', -1) do 
   		delete :destroy, id: @attorney.id
   	end 
   end 
   	
end
