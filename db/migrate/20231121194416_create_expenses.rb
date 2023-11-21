class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :total_amount
      t.datetime :created_at
    end
  end
end
