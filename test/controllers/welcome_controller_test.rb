require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:three)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get welcome_url
    assert_response :success
  end

  test "should get overview" do
    sign_in @user
    get "/welcome/overview"
    assert_response :success
  end

  test "should get make_transaction" do
    sign_in @user
    get "/welcome/make_transaction"
    assert_response :success
  end

  test "should post save_transaction" do
    sign_in @user
    account1 = @user.accounts.create(currency: 0, account_type: "Saving account", balance:20)
    account2 = @user.accounts.create(currency: 0, account_type: "Current account")
    amount = 10
    post "/welcome/save_transaction", params: {account_from: account1.account_type,
    account_to: account2.account_type, amount: amount}
    assert_redirected_to "/welcome/overview"
    assert account1.transactions.length == 1
    assert account2.transactions.length == 1
    transaction1 = account1.transactions.first
    transaction2 = account2.transactions.first
    assert transaction1.payee == account2.account_type
    assert transaction1.amount == -amount
    assert transaction2.payee == account1.account_type
    assert transaction2.amount == amount
  end

  test "should post save_transaction does not create transaction when account types are the same" do
    sign_in @user
    account1 = @user.accounts.create(currency: 0, account_type: "Saving account", balance: 20)
    amount = 10
    post "/welcome/save_transaction", params: {account_from: account1.account_type,
    account_to: account1.account_type, amount: amount}
    assert account1.transactions.length == 0


  end

  test "should post save_transaction does not create transaction when amount is not positive" do
    sign_in @user
    account1 = @user.accounts.create(currency: 0, account_type: "Saving account", balance:20)
    account2 = @user.accounts.create(currency: 0, account_type: "Current account")
    amount = 0
    post "/welcome/save_transaction", params: {account_from: account1.account_type,
    account_to: account2.account_type, amount: amount}
    assert account1.transactions.length == 0
    assert account2.transactions.length == 0

  end

  test "should post save_transaction does not create transaction when the account from has insufficient balance" do
    sign_in @user
    account1 = @user.accounts.create(currency: 0, account_type: "Saving account")
    account2 = @user.accounts.create(currency: 0, account_type: "Current account")
    amount = 10
    post "/welcome/save_transaction", params: {account_from: account1.account_type,
    account_to: account2.account_type, amount: amount}
    assert account1.transactions.length == 0
    assert account2.transactions.length == 0

  end

  test "should get transactions" do
    sign_in @user
    account = @user.accounts.create(currency: 0)
    get "/welcome/transactions/" + account.id.to_s
    assert_response :success
  end


end
