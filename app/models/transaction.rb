# frozen_string_literal: true
class Transaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: %i[CARD_PAYMENT MANUAL_PAYMENT RECEIVED]

  validates :payee, presence: true
  validates :amount, presence: true
  validates :date, presence: true
  validates :transaction_type, presence: true
end
