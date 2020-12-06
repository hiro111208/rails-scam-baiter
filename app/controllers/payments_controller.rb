# frozen_string_literal: true
class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    account = user_account
    @currency = account.currency
    @transactions = account.transactions.order(created_at: :desc).first(5)
  end

  def create
    first_name = params[:firstName]
    amount = params[:amount].to_d
    iban = params[:iban]

    account = user_account
    balance = account.balance

    if (balance - amount).negative?
      redirect_to '/payments', flash: { error: "Payment is not possible. Balance can't be less than 0" }
    else
      account.transactions.create(payee: first_name, amount: amount, date: Time.now, transaction_type: 1)
      account.balance -= amount
      account.save
      redirect_to '/payments', flash: { success: 'Payment processed.' }
    end
  end

  private

  def user_account
    # TODO: This should be fixed to work with multiple accounts
    current_user.accounts.take
  end
end
