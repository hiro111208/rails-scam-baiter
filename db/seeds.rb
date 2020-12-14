# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Transaction.destroy_all
#User.destroy_all

#user = User.new(firstName: 'TestF', lastName: 'TestL', email: 'testing@mail.com', password: 'testing')
#user.save

#User.create([{ firstName: "John", lastName: "Oakes", email: "johnoakes@mail.com", password: "Oakes" }])
#Account.create([{ currency: 0, user_id: 1 }])
#Transaction.create([{ payee: 'McDonalds', amount: 2.99, date: Date.new(2020, 12, 11), transaction_type: 'CARD_PAYMENT', account_id: 1 }])

#account = Account.new(currency: 0, user_id: 5)
#account.save

#transaction = Transaction.new(payee: 'McDonalds', amount: 2.99, date: Date.new(2020, 12, 11), transaction_type: 'CARD_PAYMENT', account_id: 5)
#transaction.save

transaction_list = [
  [ "McDonalds", 2.99, Date.new(2020, 12, 11), 'CARD_PAYMENT', 1],
  [ "Starbucks", 5.79, Date.new(2020, 12, 11), 'CARD_PAYMENT', 1],
  [ "Post Office", 30.35, Date.new(2020, 12, 11), 'CARD_PAYMENT', 1 ]
]

transaction_list.each do |payee, amount, date, transaction_type, account_id|
  Transaction.create(payee: payee, amount: amount, date: date, transaction_type: transaction_type, account_id: account_id)
end
