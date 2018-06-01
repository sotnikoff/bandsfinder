class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def index; end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(user_id: current_user.id)
    if group.save
      redirect_to group_path(group)
    else
      redirect_to root
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
