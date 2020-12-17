class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :payee
      t.float :amount
      t.date :date
      t.account_id :integer

      t.timestamps
    end


  end
end
