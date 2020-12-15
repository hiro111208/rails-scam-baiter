# frozen_string_literal: true
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
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
