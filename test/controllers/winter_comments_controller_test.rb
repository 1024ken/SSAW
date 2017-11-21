require 'test_helper'

class WinterCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get winter_comments_create_url
    assert_response :success
  end

end
