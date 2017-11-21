require 'test_helper'

class SummerCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get summer_comments_create_url
    assert_response :success
  end

end
