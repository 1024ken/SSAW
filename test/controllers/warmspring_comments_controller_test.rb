require 'test_helper'

class WarmspringCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get warmspring_comments_create_url
    assert_response :success
  end

end
