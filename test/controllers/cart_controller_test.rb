require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get my_cart" do
    get :my_cart
    assert_response :success
  end

end
