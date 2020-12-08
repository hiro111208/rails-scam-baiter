# frozen_string_literal: true
class Transaction < ApplicationRecord
  belongs_to :account
  enum transaction_type: %i[CARD_PAYMENT MANUAL_PAYMENT RECEIVED]
end
