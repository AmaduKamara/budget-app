require 'rails_helper'

RSpec.describe 'expenses#index', type: :feature do
  describe 'Expense' do
    before(:each) do
      @user = User.create(name: 'Amkam', surname: 'WebAvenger', email: 'amkam@gmail.com', password: 'test12345')
      visit new_user_session_path
      fill_in 'Email', with: 'amkam@gmail.com'
      fill_in 'Password', with: 'test12345'
      click_button 'Log in'

      @category = Category.create(user: @user, name: 'Cars', icon: 'https://icon-link')

      @expense1 = Expense.create(user: @user, name: 'Food', amount: 5)
      @expense2 = Expense.create(user: @user, name: 'Car', amount: 5)
      @expense3 = Expense.create(user: @user, name: 'Drink', amount: 5)
      @expense4 = Expense.create(user: @user, name: 'Oil', amount: 5)

      @category_expense = CategoryExpense.create(category: @category, expense: @expense1)

      visit(category_expenses_path(@category.id))
    end

    it 'shows the expense name' do
      expect(page).to have_content('Food')
    end

    it 'shows the expense amount' do
      expect(page).to have_content('5')
    end
  end
end