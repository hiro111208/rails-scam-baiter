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
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = 'Transaction created'
      redirect_to(transactions_path)
    else
      render('new')
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
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

  def user_account
    # TODO: This should be fixed to work with multiple accounts
    current_user.accounts.take
  end
end
