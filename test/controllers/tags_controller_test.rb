require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tags_new_url
    assert_response :success
  end

  test "should get create" do
    get tags_create_url
    assert_response :success
  end

  test "should get index" do
    get tags_index_url
    assert_response :success
  end

end
