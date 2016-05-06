require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  def setup
    sign_in users(:one)
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

  test "should show individual providers" do 
    provider = Provider.first
    get :show, id: provider.id
    assert_response :success 
  end 

   test "should get edit page" do 
    provider = Provider.first
    get :edit, id: provider.id
    assert_response :success
   end 

   test "should update article" do 
    provider = Provider.first 
    patch :update, id: provider.id, provider: {
      secondlineaddress: "Suite 1400"
    }
    assert_redirected_to providers_path
   end 

   test "should destroy new provider" do 
    provider = Provider.first 
    assert_difference('Provider.count', -1) do 
      delete :destroy, id: provider.id
    end 
   end 
end 
