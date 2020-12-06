# frozen_string_literal: true
class InitializeUser < ActiveRecord::Migration[6.0]
  def change
    @user = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
    @user.save
  end
end
