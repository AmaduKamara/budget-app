# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.order(created_at: :desc).all
    @total_amount = []

    @categories.each do |category|
      total = 0
      category.category_expenses.each do |category_expense|
        total += category_expense.expense.amount
      end
      @total_amount.push(total)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @new_category = current_user.categories.new(category_params)
    if @new_category.save
      redirect_to categories_path, flash: { alert: 'Your category is registered' }
    else
      redirect_to new_category_path, flash: { alert: 'Could not register your category' }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
