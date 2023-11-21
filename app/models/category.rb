class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, length: { minimum: 2 }
  validates :icon, presence: true
end
