class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.order('created_at DESC')
  end
end
