class AddTypeToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :type, :integer
  end
end
