require "test_helper"

class DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dishes_path
    assert_response :success
  end
end
