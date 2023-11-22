class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount
      t.timestamp :created_at
    end
  end
end
