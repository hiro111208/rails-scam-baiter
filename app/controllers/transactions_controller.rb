class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.all
  end

  #def show
  #  @transactions = Transaction.all
  #end

end
