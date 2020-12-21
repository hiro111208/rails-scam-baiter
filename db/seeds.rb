# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Account.destroy_all
Transaction.destroy_all
user = User.create(firstName: 'TestF', lastName: 'TestL', email: 'test@example.com', admin: true, password: 'password', password_confirmation: 'password')
account = user.accounts.create(currency: 0, account_type: "Current_account", account_number: "1234", sort_code: "12-34-56")

account.transactions.create(payee: 'Starbucks', amount: -2.75, date: Date.new(2020, 12, 1), transaction_type: 0)
account.transactions.create(payee: 'McDonalds', amount: -9.25, date: Date.new(2020, 12, 1), transaction_type: 0)
account.transactions.create(payee: 'Wasabi', amount: -5.75, date: Date.new(2020, 12, 2), transaction_type: 0)
account.transactions.create(payee: 'Shell', amount: -27.5, date: Date.new(2020, 12, 3), transaction_type: 0)

account2 = user.accounts.create(currency: 1, account_type: "Savings", account_number: "5678", sort_code: "67-54-21")

account.transactions.create(payee: 'TestF Saving Account', amount: 0.75, date: Date.new(2020, 10, 31), transaction_type: 1)
account.transactions.create(payee: 'TestF Saving Account', amount: 100.25, date: Date.new(2020, 01, 11), transaction_type: 1)
account.transactions.create(payee: 'TestF Saving Account', amount: 89.75, date: Date.new(2020, 12, 28), transaction_type: 1)
account.transactions.create(payee: 'TestF Saving Account', amount: 10.5, date: Date.new(2020, 12, 2), transaction_type:1)

account2.transactions.create(payee: 'TestF Current Account', amount: -0.75, date: Date.new(2020, 10, 31), transaction_type: 1)
account2.transactions.create(payee: 'TestF Current Account', amount: -100.25, date: Date.new(2020, 01, 11), transaction_type: 1)
account2.transactions.create(payee: 'TestF Current Account', amount: -89.75, date: Date.new(2020, 12, 28), transaction_type: 1)
account2.transactions.create(payee: 'TestF Current Account', amount: -10.5, date: Date.new(2020, 12, 2), transaction_type:1)
