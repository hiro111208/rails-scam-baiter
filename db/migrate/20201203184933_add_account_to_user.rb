# frozen_string_literal: true
class AddAccountToUser < ActiveRecord::Migration[6.0]
  def change
    user = User.where(email: 'test@example.com').take

    user.accounts.create(currency: 0)
  end
end
