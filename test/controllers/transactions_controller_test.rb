require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get transactions" do
    get transactions_transactions_url
    assert_response :success
  end

end
