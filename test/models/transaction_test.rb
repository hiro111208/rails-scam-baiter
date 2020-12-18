# frozen_string_literal: true
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end
  def setup
    user1 = User.create(firstName: 'TestF',
                        lastName: 'TestL',
                        email: 'test@example.com',
                        admin: true,
                        password: 'password',
                        password_confirmation: 'password')

    account1 = user1.accounts.create(currency: 0)

    @transaction = account1.transactions.new(payee: 'Starbucks',
                                             amount: 2.75,
                                             date: Date.new(2020, 12, 1),
                                             transaction_type: 0)
  end

  test 'transaction should be valid' do
    assert @transaction.valid?
  end

  test 'payee can be present' do
    @transaction.payee = ' '
    assert_not @transaction.valid?
  end

  test 'amount should be present' do
    @transaction.amount = ' '
    assert_not @transaction.valid?
  end

  test 'date should be present' do
    @transaction.date = ' '
    assert_not @transaction.valid?
  end

  test 'payee should not be too long' do
    @transaction.payee = 'a' * 51
    assert_not @transaction.valid?
  end

  test 'amount should be number' do
    @transaction.amount = 'seg2020'
    assert_not @transaction.valid?
  end

  test 'should not save transaction without payee' do
    account_id = accounts(:one).id
    transaction = Transaction.new(amount: 15.5, date: Time.now, transaction_type: 1, account_id: account_id)
    assert_not transaction.save, 'Saved the transaction without payee'
  end

  test 'should not save transaction without amount' do
    account_id = accounts(:one).id
    transaction = Transaction.new(payee: 'Test', date: Time.now, transaction_type: 1, account_id: account_id)
    assert_not transaction.save, 'Saved the transaction without amount'
  end

  test 'should not save transaction without date' do
    account_id = accounts(:one).id
    transaction = Transaction.new(payee: 'Test', amount: 15.5, transaction_type: 1, account_id: account_id)
    assert_not transaction.save, 'Saved the transaction without date'
  end

  test 'should not save transaction without transaction type' do
    account_id = accounts(:one).id
    transaction = Transaction.new(payee: 'Test', amount: 15.5, date: Time.now, account_id: account_id)
    assert_not transaction.save, 'Saved the transaction without transaction type'
  end

  test 'should save transaction with proper data' do
    account_id = accounts(:one).id
    transaction = Transaction.new(payee: 'Test', amount: 15.5, date: Time.now, transaction_type: 1, account_id: account_id)
    assert transaction.save, 'Failed to save transaction with right data'
  end
end
