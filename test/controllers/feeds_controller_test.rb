require "test_helper"

class FeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feeds_path
    assert_response :success
  end
end
