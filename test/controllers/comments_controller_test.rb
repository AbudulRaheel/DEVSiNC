require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get comments" do
    get comments_comments_url
    assert_response :success
  end

end
