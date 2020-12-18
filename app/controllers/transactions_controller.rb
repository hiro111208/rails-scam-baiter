class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.order('created_at DESC')
    @accounts = Account.all
  end

  #def show
  #  @transactions = Transaction.all
  #end

end
