class Transaction < ApplicationRecord
  enum type: [:CARD_PAYMENT, :MANUAL_PAYMENT, :RECEIVED]
end
