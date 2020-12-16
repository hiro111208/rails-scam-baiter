# frozen_string_literal: true
class Transaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: %i[CARD_PAYMENT MANUAL_PAYMENT RECEIVED]

  def generate_random_data(payee, amount, date, transaction_type, user_account)
    @payees = []
    @amounts = []
    @dates = []
    @transactions = Transaction.all
    @transaction_types = ['CARD_PAYMENT', 'MANUAL_PAYMENT']
    @transactions.each do |transaction|
      @payees.push(transaction.payee)
      @amounts.push(transaction.amount)
      @dates.push(transaction.date)
    end
    for num in 1..10 do
      user_account.transaction.create(@payees.sample, rand(amounts.min..amounts.max), @dates.sample, @transaction_types.sample, )
    end
  end
end
