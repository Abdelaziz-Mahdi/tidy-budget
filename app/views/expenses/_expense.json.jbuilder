json.extract! expense, :id, :author_id, :name, :total_amount, :created_at, :created_at, :updated_at
json.url expense_url(expense, format: :json)
