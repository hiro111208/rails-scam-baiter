require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin_user = users(:one)
    sign_in @admin_user
    @account = accounts(:one)
    @account.user_id = @admin_user.id
    #@account.save
    @transaction = transactions(:one)
    @transaction.account_id = @account.id
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, balance: @transaction.balance, date: @transaction.date, payee: @transaction.payee, transaction_type: @transaction.transaction_type } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount, balance: @transaction.balance, date: @transaction.date, payee: @transaction.payee, transaction_type: @transaction.transaction_type } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
