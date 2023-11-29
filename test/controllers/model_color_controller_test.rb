require "test_helper"

class ModelColorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get model_color_index_url
    assert_response :success
  end

  test "should get show" do
    get model_color_show_url
    assert_response :success
  end
end
