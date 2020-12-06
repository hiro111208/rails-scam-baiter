# frozen_string_literal: true
class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  enum currency: %i[USD EUR GBP]
  attribute :balance, :decimal, default: 0
  # Fields: currency, balance
end
