require 'test_helper'

class JianshuControllerTest < ActionDispatch::IntegrationTest
  test "should get handle_image" do
    get jianshu_handle_image_url
    assert_response :success
  end

end
