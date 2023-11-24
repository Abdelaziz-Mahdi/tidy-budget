class CreateCategoryExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :category_expenses do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :expense, null: false, foreign_key: { to_table: :expenses }
      t.timestamps
    end
  end
end
