require 'test_helper'

class AutumnCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get autumn_comments_create_url
    assert_response :success
  end

end
