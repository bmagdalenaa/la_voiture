require "test_helper"

class ColorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get color_index_url
    assert_response :success
  end

  test "should get show" do
    get color_show_url
    assert_response :success
  end
end
