require "test_helper"

class ResumeparserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resumeparser_index_url
    assert_response :success
  end
end
