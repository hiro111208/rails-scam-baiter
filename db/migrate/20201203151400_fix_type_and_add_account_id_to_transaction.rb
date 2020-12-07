class FixTypeAndAddAccountIdToTransaction < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :type, :transaction_type
    remove_column :transactions, :account_id
    add_column :transactions, :account_id, :integer
  end
end
