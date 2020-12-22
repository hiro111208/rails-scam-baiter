json.extract! transaction, :id, :account_id, :payee, :amount, :transaction_type, :balance, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
