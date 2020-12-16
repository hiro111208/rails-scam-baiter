class TransactionsController < ApplicationController
  before_action :authenticate_user!
  #before_action :admin_user

  def index

    @transactions = Transaction.order('created_at DESC')
    #@accounts = Account.all
  end

  def show
    @transactions = Transaction.order('created_at DESC')
  end

  def new
    @current_account = user_account
    @transaction = @current_account.transactions.new
    #@account_id = Account.find(@transaction.account_id).id
    #@account_id = @account.id

  end

  def create
    @current_account = user_account
    payee = params[:payee]
    amount = params[:amount]
    date = params[:date]
    @transaction_type = params[:transaction_type]
    @transaction = @current_account.transactions.new(transaction_params)
    if @transaction.save
      flash[:success] = 'Transaction created'
      redirect_to(transactions_path)
    else
      render('new')
    end
  end

  def generate_random
    @current_account = user_account
    @payees = []
    @amounts = []
    @dates = []
    @transactions = Transaction.all
    @transaction_types = ['CARD_PAYMENT', 'MANUAL_PAYMENT']
    @transactions.each do |transaction|
      @payees.push(transaction.payee)
      @amounts.push(transaction.amount)
      @dates.push(transaction.date)
    end
  end

  helper_method :generate_random

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def edit_data
    @current_account = user_account
    @payees = []
    @amounts = []
    @dates = []
    @transactions = Transaction.all
    @transaction_types = ['CARD_PAYMENT', 'MANUAL_PAYMENT']
    @transactions.each do |transaction|
      @payees.push(transaction.payee)
      @amounts.push(transaction.amount)
      @dates.push(transaction.date)
    end
    #Transaction.first.update_attributes(payee: "James")
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      flash[:success] = 'Transaction updated'
      redirect_to(transaction_path(@transaction))
    else
      render('edit')
    end
  end

  def delete
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    flash[:success] = 'Transaction deleted'
    redirect_to(transactions_path)
  end

  private
  def transaction_params
    params.require(:transaction).permit(
      :payee,
      :amount,
      :date,
      :transaction_type
    )
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def user_account
    # TODO: This should be fixed to work with multiple accounts
    current_user.accounts.first
  end
end
