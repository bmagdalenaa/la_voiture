require "test_helper"

class VehicleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicle_index_url
    assert_response :success
  end

  test "should get show" do
    get vehicle_show_url
    assert_response :success
  end
end
