require "test_helper"

class TypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get type_index_url
    assert_response :success
  end

  test "should get show" do
    get type_show_url
    assert_response :success
  end
end
