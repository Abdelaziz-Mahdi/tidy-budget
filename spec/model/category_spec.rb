require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Mahdi', email: 'mahdi@gmail.com', password: 'password')
    category = Category.new(user:, name: 'Food', icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(name: 'Mahdi')
    expect(category).to_not be_valid
  end

  it 'requires a unique name' do
    Category.create(name: 'Existing Category', icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    new_category = Category.create(name: 'New Category', icon: 'https://image.flaticon.com/icons/png/512/1046/1046784.png')
    expect(new_category).to_not be_valid
  end
end
