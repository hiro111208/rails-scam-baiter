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
user1 = User.create(firstName: 'TestF', lastName: 'TestL', email: 'test@example.com', admin: true, password: 'password', password_confirmation: 'password')
account1 = user1.accounts.create(currency: 0)
account1.transactions.create(payee: 'Starbucks', amount: 2.75, date: Date.new(2020, 12, 1), transaction_type: 0)
account1.transactions.create(payee: 'McDonalds', amount: 9.25, date: Date.new(2020, 12, 1), transaction_type: 0)
account1.transactions.create(payee: 'Wasabi', amount: 5.75, date: Date.new(2020, 12, 2), transaction_type: 0)
account1.transactions.create(payee: 'Shell', amount: 27.5, date: Date.new(2020, 12, 3), transaction_type: 0)

user2 = User.create(firstName: 'Paul', lastName: 'Smith', email: 'paul.smith@gmail.com', admin: false, password: 'seg2020', password_confirmation: 'seg2020')
account2 = user2.accounts.create(currency: 1)
account2.transactions.create(payee: 'Primark', amount: 50.55, date: Date.new(2020, 3, 4), transaction_type: 0)
account2.transactions.create(payee: 'ZARA', amount: 120.00, date: Date.new(2020, 4, 1), transaction_type: 0)
account2.transactions.create(payee: 'H&M', amount: 20.0, date: Date.new(2020, 6, 2), transaction_type: 0)
account2.transactions.create(payee: 'UNIQLO', amount: 27.5, date: Date.new(2020, 9, 3), transaction_type: 0)
