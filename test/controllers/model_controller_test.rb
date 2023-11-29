require "test_helper"

class ModelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get model_index_url
    assert_response :success
  end

  test "should get show" do
    get model_show_url
    assert_response :success
  end
end
