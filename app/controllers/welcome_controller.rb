class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def contactus
  end

  def overview
  end

  def make_transaction
    if not current_user
      redirect_to root_path, flash: {error: "You need to login first"}
    else
      @accounts = current_user.accounts.map { |account| account.account_type }
    end
  end

  def save_transaction
    if not current_user
      redirect_to root_path, flash: {error: "You need to login first"}
    else
      account_from_type = transaction_params[:account_from]
      account_to_type = transaction_params[:account_to]
      account_from = current_user.accounts.find_by account_type: account_from_type
      account_to = current_user.accounts.find_by account_type: account_to_type
      amount = transaction_params[:amount].to_f
      if account_from_type == account_to_type
        redirect_to "/welcome/make_transaction", flash: { error: "Account from and to have to be different"}

      elsif amount <= 0
        redirect_to "/welcome/make_transaction", flash: { error: "Amount has to be a positive number"}

      elsif account_from.balance < amount
        redirect_to "/welcome/make_transaction", flash: { error: "You have insufficient balance in the from account"}
      else
        account_from.balance -= amount
        account_to.balance += amount
        account_from.transactions.create(payee: account_to_type, amount: -amount, date: Date.today, transaction_type: 1, balance: account_from.balance)
        account_to.transactions.create(payee: account_from_type, amount: amount, date: Date.today, transaction_type: 1, balance: account_to.balance)
        account_from.save
        account_to.save
        redirect_to "/welcome/overview", flash: {success: "Success!"}
      end
    end
  end

  def transactions
    if not current_user
      redirect_to root_path, flash: {error: "You need to login first"}
    else
      @account= current_user.accounts.find(params[:account_id].to_i)
    end
  end

  private
    def transaction_params
      params.permit(:account_from, :account_to, :amount, :authenticity_token, :commit)
    end

end
