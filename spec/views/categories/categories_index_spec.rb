# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories#index', type: :feature do
  describe 'Group' do
    before(:each) do
      @user = User.create(name: 'Amkam', surname: 'WebAvenger', email: 'amkam@gmail.com', password: 'test12345')
      visit new_user_session_path
      fill_in 'Email', with: 'amkam@gmail.com'
      fill_in 'Password', with: 'test12345'
      click_button 'Log in'

      @category1 = Category.create(user: @user, name: 'Cars', icon: 'https://icon-link')
      @category2 = Category.new(user: @user, name: 'Foods', icon: 'icon-link')
      @category3 = Category.new(user: @user, name: 'Drinks', icon: 'icon-link')
      @category4 = Category.new(user: @user, name: 'Grocery', icon: 'icon-link')

      visit(categories_path)
    end

    it 'shows the category name' do
      expect(page).to have_content('Cars')
    end

    it 'shows the category icon' do
      expect(page).to have_content('Add new category')
    end
  end
end
