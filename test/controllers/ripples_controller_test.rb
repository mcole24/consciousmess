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

  
end
