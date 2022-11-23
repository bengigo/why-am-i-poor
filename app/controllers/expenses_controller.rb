class ExpensesController < ApplicationController
  def index
    # @group = current_user.groups.find(params[:group_id])
    # @expenses = @group.expenses.order(created_at: :desc)
    # @total = @expenses.sum(:amount)
    @group = current_user.groups.find(params[:group_id])
    @expenses = Expense.where(group_id: params[:group_id])
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    # @expense.group_id = params[:group_id]
    if @expense.save
      redirect_to group_expenses_path
    else
      render :new
    end
  end

  def expense_params
    # params.permit(:name, :amount, :group_id)
    params.require(:expense).permit(:name, :amount)
  end
end
