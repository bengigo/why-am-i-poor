class ExpensesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    @expenses = @group.expenses.all.order(created_at: :desc)
    @total = @expenses.sum(:amount)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @expense = @group.expenses.create(name: params[:expense][:name], amount: params[:expense][:amount],
                                      user_id: current_user.id)
    if @expense.save
      redirect_to group_expenses_path
    else
      render :new
    end
  end
end
