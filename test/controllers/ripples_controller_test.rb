require 'test_helper'

class RipplesControllerTest < ActionController::TestCase
  
  fixtures :ripples
  self.use_transactional_tests = true
  
  setup do
    @ripple = ripples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ripples)
  end

  test "should get new" do
    get new_ripple_url
    assert_response :success
  end

  test "should create ripple" do
    assert_difference('Ripple.count') do
      post ripples_url, params: { ripple: { message: @ripple.message, name: @ripple.name, url: @ripple.url } }
    end

    assert_redirected_to ripple_url(Ripple.last)
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
  end
  
  

  
end
