require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get useradmin" do
    get :useradmin
    assert_response :success
  end

end
