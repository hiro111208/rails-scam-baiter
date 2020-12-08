class ChangeDateInTransactionToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :date, :datetime
  end
end
