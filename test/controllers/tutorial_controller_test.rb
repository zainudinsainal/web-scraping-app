require 'test_helper'

class TutorialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorial_index_url
    assert_response :success
  end

  test "should get view" do
    get tutorial_view_url
    assert_response :success
  end

  test "should get queue" do
    get tutorial_queue_url
    assert_response :success
  end

end
