class Transaction < ApplicationRecord
  enum desc: [:CARD_PAYMENT, :MANUAL_PAYMENT, :RECEIVED]
end
