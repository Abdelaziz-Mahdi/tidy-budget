require 'rails_helper'

RSpec.describe 'CategoriesControllers', type: :feature do
  describe 'GET /categories' do
    before do
      @user = User.find_or_create_by(name: 'Mahdi', email: 'mahdi@gmail.com') do |user|
        user.password = 'password'
      end
      @category = Category.find_or_create_by(user: @user, name: 'Food') do |category|
        category.icon = 'https://image.flaticon.com/icons/png/512/1046/1046784.png'
      end
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
    end

    it 'renders the categories/index view' do
      visit categories_path
      expect(page).to have_http_status(:success)
    end

    it 'renders a list with the categories for the user' do
      expect(page).to have_content('Food')
    end

    it 'renders a button to add a new category' do
      expect(page).to have_link('Add a new category')
    end

    it 'clicks on the add a new category button to create a new one' do
      click_link 'Add a new category'
      expect(page).to have_current_path(new_category_path)
    end
  end
end
