require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  # test "should get new" do
  #   get new_link_path
  #   assert_response :success
  # end

  test "should get show" do
    link = links(:one)
    get link_path(link)
    assert_response :success
  end

  # test "should get edit" do
  #   link = links(:one)
  #   get edit_link_path(link)
  #   assert_response :success
  # end
end
