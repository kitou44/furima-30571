class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :show]
  
  def index
    @items = Items.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
