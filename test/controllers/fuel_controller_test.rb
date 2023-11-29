require "test_helper"

class FuelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fuel_index_url
    assert_response :success
  end

  test "should get show" do
    get fuel_show_url
    assert_response :success
  end
end
