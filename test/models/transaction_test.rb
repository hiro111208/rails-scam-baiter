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
end
