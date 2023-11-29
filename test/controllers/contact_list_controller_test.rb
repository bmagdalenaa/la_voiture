require "test_helper"

class ContactListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_list_index_url
    assert_response :success
  end

  test "should get show" do
    get contact_list_show_url
    assert_response :success
  end
end
