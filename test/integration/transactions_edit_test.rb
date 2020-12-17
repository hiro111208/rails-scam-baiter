require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin_user = User.create(firstName: 'TestF',
                              lastName: 'TestL',
                              email: 'test@example.com',
                              admin: true,
                              password: 'password',
                              password_confirmation: 'password')

    @account1 = @admin_user.accounts.create(currency: 0)

    @transaction1 = @account1.transactions.new(payee: 'Starbucks',
                                               amount: 2.75,
                                               date: Date.new(2020, 12, 1),
                                               transaction_type: 'CARD_PAYMENT')

    @non_admin_user = User.create(firstName: 'TestF2',
                                  lastName: 'TestL2',
                                  email: 'test2@example.com',
                                  admin: false,
                                  password: 'password',
                                  password_confirmation: 'password')

    @account2 = @non_admin_user.accounts.create(currency: 1)

    @transaction2 = @account2.transactions.new(payee: 'Wasabi',
                                               amount: 5.75,
                                               date: Date.new(2020, 12, 1),
                                               transaction_type: 'CARD_PAYMENT')
  end

  test 'unsuccessful transaction edit' do
    sign_in @admin_user
    get edit_transaction_path(@transaction1)
    assert_template 'transactions/edit'
    patch transactions_path(@transaction1), params: { transaction: { payee: 'Itsu',
                                                                     amount: 5.00,
                                                                     date: Date.new(2020, 12, 2),
                                                                     transaction_type: 'CARD_PAYMENT' } }
    assert_template 'transactions/edit'
  end

  test 'successful transaction edit' do
    sign_in @admin_user
    get edit_transaction_path(@transaction1)
    assert_template 'transactions/edit'
    patch transactions_path(@transaction1), params: { transaction: { payee: 'Itsu',
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
