require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin_user = users(:one)

    account1 = @admin_user.accounts.create(currency: 0)

    @transaction1 = account1.transactions.create(payee: 'Starbucks',
                                                 amount: 2.75,
                                                 date: Date.new(2020, 12, 1),
                                                 transaction_type: 0)

    @non_admin_user = users(:two)

    account2 = @non_admin_user.accounts.create(currency: 1)

    @transaction2 = account2.transactions.create(payee: 'Wasabi',
                                                 amount: 5.75,
                                                 date: Date.new(2020, 12, 1),
                                                 transaction_type: 0)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get index' do
    sign_in @admin_user
    get transactions_url(@transaction1)
    assert_response :success
  end

  test 'non_admin should not get index' do
    sign_in @non_admin_user
    get transactions_url(@transaction2)
    assert_redirected_to root_path
  end

  test 'should get show' do
    sign_in @admin_user
    get transactions_url(@transaction1)
    assert_response :success
  end

  test 'non_admin should get show' do
    sign_in @non_admin_user
    get '/transactions/show'
    assert_response :success
  end

  test 'post create should create new 10 data' do
    sign_in @admin_user
    assert_difference('Transaction.count', 10) do
      post transactions_url
    end
    follow_redirect!
    assert_response :success
  end

  test 'non_admin post create should not work' do
    sign_in @non_admin_user
    assert_no_difference('Transaction.count') do
      post transactions_url
    end
    assert_redirected_to root_path
  end

  test 'should get edit' do
    sign_in @admin_user
    get edit_transaction_url(@transaction1)
    assert_response :success
  end

  test 'non_admin should not get edit' do
    sign_in @non_admin_user
    get edit_transaction_url(@transaction2)
    assert_redirected_to root_path
  end

  test 'delete should remove transaction' do
    sign_in @admin_user
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction1)
    end
    assert_redirected_to transactions_path
  end

  test 'non_admin delete should not remove transaction' do
    sign_in @non_admin_user
    assert_no_difference('Transaction.count') do
      delete transaction_url(@transaction2)
    end
    assert_redirected_to root_path
  end
end
