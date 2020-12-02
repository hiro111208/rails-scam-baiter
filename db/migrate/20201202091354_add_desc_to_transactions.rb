class AddDescToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :desc, :integer
  end
end
