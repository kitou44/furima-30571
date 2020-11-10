class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(items_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def items_params
   params.require(:item).permit(:name, :description, :size, :category_id,  :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id ).merge(user_id: current_user.id)
  end

  def set_items
    @items = Items.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
