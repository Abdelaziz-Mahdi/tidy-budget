require 'rails_helper'

RSpec.describe 'MovementsControllers', type: :feature do
  before do
    @user = User.find_or_create_by(name: 'Mahdi', email: 'mahdi@gmail.com') do |user|
      user.password = 'password'
    end
    @category = Category.find_or_create_by(user: @user, name: 'Food') do |category|
      category.icon = 'microverse.png'
    end
    visit user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
  end

  describe 'GET #new' do
    it 'renders the add a new expenses page' do
      visit new_expense_path
      expect(page).to have_http_status(:success)
    end
  end

end
