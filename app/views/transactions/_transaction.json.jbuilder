json.extract! transaction, :id, :account_id, :payee, :amount, :transaction_type, :balance, :date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
