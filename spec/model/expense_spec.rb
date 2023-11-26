require 'rails_helper'

RSpec.describe Expense, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(name: 'Mahdi', email: 'mahdi@gmail.com', password: 'password')
    category = Category.new(user:, name: 'Food', icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expense = Expense.new(author_id: user.id, name: 'Milk', amount: 50)
    category.expenses << expense
    expect(expense).to be_valid
  end

  it 'is not valid without a user' do
    expense = Expense.new(name: 'Milk', amount: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expect(expense).to_not be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: 'Mahdi', email: 'mahdi@gmail.com', password: 'password')
    category = Category.new(user:, name: 'Food', icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expense = Expense.new(author_id: user.id, amount: 50)
    category.expenses << expense
    expect(expense).to_not be_valid
  end

  it 'has and belongs to many expenses ' do
    expense = Expense.reflect_on_association(:categories)
    expect(expense.macro).to eq(:has_many)
  end
end
