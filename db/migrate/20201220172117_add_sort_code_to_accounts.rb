class AddSortCodeToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :sort_code, :string
  end
end
