require 'test_helper'

class BankLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_login_index_url
    assert_response :success
  end

  test "should get login" do
    get bank_login_login_url
    assert_response :success
  end

end
