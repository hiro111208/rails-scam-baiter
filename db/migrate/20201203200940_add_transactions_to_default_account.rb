class AddTransactionsToDefaultAccount < ActiveRecord::Migration[6.0]
  def change
    user = User.where(email: 'test@example.com').take

    account = user.accounts.where(currency: 0).take

    account.transactions.create(payee: 'Starbucks', amount: 2.75, date: Date.new(2020, 12, 1), transaction_type: 0)
    account.transactions.create(payee: 'McDonalds', amount: 9.25, date: Date.new(2020, 12, 1), transaction_type: 0)
    account.transactions.create(payee: 'Wasabi', amount: 5.75, date: Date.new(2020, 12, 2), transaction_type: 0)
    account.transactions.create(payee: 'Shell', amount: 27.5, date: Date.new(2020, 12, 3), transaction_type: 0)
  end
end
