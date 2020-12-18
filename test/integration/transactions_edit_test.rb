require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
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

  test 'unsuccessful transaction edit' do
    sign_in @admin_user
    get edit_transaction_path(@transaction1)
    assert_template 'transactions/edit'
    patch transaction_path(@transaction1), params: { transaction: { payee: ' ',
                                                                    amount: 5.00,
                                                                    date: Date.new(2020, 12, 2),
                                                                    transaction_type: 'CARD_PAYMENT' } }
    assert_template 'transactions/edit'
  end

  test 'successful transaction edit' do
    sign_in @admin_user
    get edit_transaction_path(@transaction1)
    assert_template 'transactions/edit'
    patch transaction_path(@transaction1), params: { transaction: { payee: 'Itsu',
                                                                    amount: 5.00,
                                                                    date: Date.new(2020, 12, 2),
                                                                    transaction_type: 'CARD_PAYMENT' } }
    assert_redirected_to @transaction1
  end

  test 'non_admin transaction edit should fail' do
    sign_in @non_admin_user
    get edit_transaction_path(@transaction2)
    assert_template nil
  end
end
