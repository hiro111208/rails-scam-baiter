require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  setup do
    @admin_user = users(:one)
    sign_in @admin_user
    @account = accounts(:one)
    @account.user_id = @admin_user.id
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { account_number: @account.account_number, account_type: @account.account_type, balance: @account.balance, currency: @account.currency, iban: @account.iban, user_id: @account.user_id } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { account_number: @account.account_number, account_type: @account.account_type, balance: @account.balance, currency: @account.currency, iban: @account.iban, user_id: @account.user_id } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
