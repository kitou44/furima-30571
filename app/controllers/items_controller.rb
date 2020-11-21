class ItemsController < ApplicationController
  #before_action :set_items, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_items, only: [:edit, :show,:update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    unless current_user == @item.user
     redirect_to root_path
    end
  end
 
 def update
  if @item.update(items_params)
     redirect_to item_path(@item)
  else
     render :edit
  end
 end

def destroy
  if current_user == @item.user
     @item.destroy
  end
    redirect_to root_path
end

  private

  def items_params
   params.require(:item).permit(:image,:name, :description, :category_id,  :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id ).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

end

