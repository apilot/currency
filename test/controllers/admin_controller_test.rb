require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get counter" do
    get admin_counter_url
    assert_response :success
  end
end
