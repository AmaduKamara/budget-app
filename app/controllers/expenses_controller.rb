class ExpensesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenses = []
    @total_amount = 0
    @category.category_expenses.order(created_at: :desc).each do |category_expense|
      @expenses.push(category_expense.expense)
      @total_amount += category_expense.expense.amount
    end
  end

  def new
    @expense = Expense.new
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    if @new_expense.save
      CategoryExpense.create(category_id: params[:category_id], expense_id: @new_expense.id)
      redirect_to category_expenses_path(params[:category_id]), flash: { alert: 'Your transaction is registered' }
    else
      redirect_to new_category_expense_path, flash: { alert: 'Could not register your transaction' }
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
