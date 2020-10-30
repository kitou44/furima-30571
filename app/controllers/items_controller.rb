class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Items.includes(:user).order("created_at DESC")
  end

  def new
    @items = Items.new
  end

  def destroy
    items = Items.find(params[:id])
    items.destroy
  end
  
  def edit
  end
  
  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end
  
  private 
  def items_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_items
    @items = Items.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
