require "test_helper"

class Account::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_login_index_url
    assert_response :success
  end
end
