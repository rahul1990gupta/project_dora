require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    tag = tags(:one)
    get tag_path(tag)
    assert_response :success
  end
end
