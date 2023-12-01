require "test_helper"

class CarModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_models_index_url
    assert_response :success
  end

  test "should get show" do
    get car_models_show_url
    assert_response :success
  end
end
