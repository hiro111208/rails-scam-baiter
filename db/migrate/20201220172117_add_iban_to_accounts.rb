class AddIbanToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :iban, :string
  end
end
