class WelcomeController < ApplicationController
  def index
  end

  def contactus
  end

  def overview
  end

  def make_transaction
    if current_user
      @accounts = current_user.accounts.map { |account| account.account_type }
      @errors=[]
    end
  end

  def save_transaction
    if current_user
      account_from_type = transaction_params[:account_from]
      account_to_type = transaction_params[:account_to]
      amount = transaction_params[:amount].to_f
      @errors = []
      if account_from_type == account_to_type
        @errors << "Account from and to have to be different"
      end
      if amount <= 0
        @errors << "Amount has to be a positive number"
      end
      if @errors.length > 0
        @accounts = current_user.accounts.map { |account| account.account_type }
        puts "rendering"
        puts @errors
        render 'make_transaction'
      else
        account_from = current_user.accounts.find_by account_type: account_from_type
        account_to = current_user.accounts.find_by account_type: account_to_type
        puts account_from.transactions
        account_from.transactions.create(payee: account_to_type, amount: -amount, date: Date.today, transaction_type: 1)
        account_to.transactions.create(payee: account_from_type, amount: amount, date: Date.today, transaction_type: 1)
        account_from.balance -= amount
        account_to.balance += amount
        account_from.save
        account_to.save
        redirect_to "/welcome/overview"
      end
    end
  end

  private
    def transaction_params
      params.permit(:account_from, :account_to, :amount)
    end

end
