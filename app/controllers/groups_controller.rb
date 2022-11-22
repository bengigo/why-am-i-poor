class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups if user_signed_in?
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to groups_path, notice: "New group created succefssfully"
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
