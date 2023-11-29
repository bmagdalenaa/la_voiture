require "test_helper"

class ManufacturerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manufacturer_index_url
    assert_response :success
  end

  test "should get show" do
    get manufacturer_show_url
    assert_response :success
  end
end
