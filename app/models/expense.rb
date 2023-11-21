class Expense < ApplicationRecord
  belongs_to :author
  has_many :categories, through: :category_expenses

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { minimum: 2 }
  validates :author, presence: true
end
