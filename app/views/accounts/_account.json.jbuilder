json.extract! account, :id, :user_id, :currency, :balance, :account_type, :account_number, :iban, :created_at, :updated_at
json.url account_url(account, format: :json)
