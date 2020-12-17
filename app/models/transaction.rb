# frozen_string_literal: true
class Transaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: %i[CARD_PAYMENT MANUAL_PAYMENT RECEIVED]


  # this is a temporary action
  def generate_random_data(user_account)
    @payees = []
    @amounts = []
    @transactions = Transaction.all
    @transaction_types = ['CARD_PAYMENT', 'MANUAL_PAYMENT']
    @transactions.each do |transaction|
      @payees.push(transaction.payee)
      @amounts.push(transaction.amount)
    end
    for num in 1..10 do
      user_account.transactions.create(payee: @payees.sample, amount: rand(@amounts.min..@amounts.max).round(2), date: Date.today - (rand * 31), transaction_type: @transaction_types.sample)
    end
  end
end
