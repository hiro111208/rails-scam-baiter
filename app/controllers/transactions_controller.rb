class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: %i[index new create edit delete destroy]

  def index
    @current_account = user_account
    @transactions = Transaction.order('date DESC').where(account_id: @current_account.id)
  end

  def show
    @current_account = user_account
    @transactions = Transaction.order('date DESC').where(account_id: user_account.id)
  end

  def new
    @current_account = user_account
    @transaction = @current_account.transactions.new
    # @account_id = Account.find(@transaction.account_id).id
    # @account_id = @account.id
  end

  def create
    @current_account = user_account
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
    @transactions = Transaction.all
    @transaction_types = %w[CARD_PAYMENT MANUAL_PAYMENT]
    @transactions.each do |transaction|
      @payees.push(transaction.payee)
      @amounts.push(transaction.amount)
    end
    (1..10).each do |_num|
      # @transaction = @current_account.transactions.create(payee: @payees.sample, amount: rand(@amounts.min..@amounts.max).round(2), date: Date.today - (rand * 31), transaction_type: @transaction_types.sample)
      @transaction = @current_account.transactions.new
      @transaction.payee = @payees.sample
      @transaction.amount = rand(@amounts.min..@amounts.max).round(2)
      @transaction.date = Date.today - (rand * 31)
      @transaction.transaction_type = @transaction_types.sample
      @transaction.save
    end
  end

  def edit
    @current_account = user_account
    @transaction = Transaction.find(params[:id])
  end

  def update
    @current_account = user_account
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

  # def set_current_user
  #  @current_user = User.find_by(id: session[:user_id])
  # end

  def user_account
    # TODO: This should be fixed to work with multiple accounts
    # current_user.accounts.find_by(id: session[:account_id])
    # current_user.accounts.find_by(params[:id])
    current_user.accounts.first
  end
end
