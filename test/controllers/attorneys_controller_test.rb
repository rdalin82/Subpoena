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
end
