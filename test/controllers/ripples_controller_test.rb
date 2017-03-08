require 'test_helper'

class RipplesControllerTest < ActionController::TestCase
  
  fixtures :ripples
  self.use_transactional_tests = true
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ripples)
  end

  test "should test redirects" do
    get :newest
    assert_response(302)
    get :oldest
    assert_response(302)
    get :next10
    assert_response(302)
    get :previous10
    assert_response(302)
  end
  
  test "should get newest" do 
    session[:page] = 0
    get :next10
    get :newest
    assert_redirected_to ripples_url
    assert_equal session[:page], 0
  end
  
  test "should get oldest" do 
    session[:page] = 1
    get :previous10
    get :oldest
    assert_equal session[:page], (Ripple.all.count / 10)
  end

end
