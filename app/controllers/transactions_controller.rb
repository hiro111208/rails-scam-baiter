class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  #def show
  #  @transactions = Transaction.all
  #end

end
