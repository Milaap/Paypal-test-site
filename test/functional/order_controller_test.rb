require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get express" do
    get :express
    assert_response :success
  end

end
