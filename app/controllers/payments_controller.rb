# frozen_string_literal: true
class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if not current_user
      redirect_to root_path
    else
      @accounts = current_user.accounts.map { |account| account.account_type }
    end
  end

  def create
    first_name = params[:firstName]
    amount = params[:amount].to_d
    # TODO: Maybe if it's one of our ibans in the system we can transfer the money?
    iban = params[:iban]
    country = params[:country]

    account = current_user.accounts.find_by account_type: params[:account]
    balance = account.balance

    if !iban.start_with?(country)
      redirect_to '/payments', flash: { error: 'Payment is not possible. IBAN is invalid' }
    elsif (balance - amount).negative?
      redirect_to '/payments', flash: { error: "Payment is not possible. Balance can't be less than 0" }
    else
      account.transactions.create(payee: first_name, amount: amount, date: Time.now, transaction_type: 1)
      account.balance -= amount
      account.save
      redirect_to '/payments', flash: { success: 'Payment processed.' }
    end
  end



end
