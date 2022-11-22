class GroupExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @group_expenses = @group.group_expenses.includes(:expense).order('created_at DESC')
  end
end
