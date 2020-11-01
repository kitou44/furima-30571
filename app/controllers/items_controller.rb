class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
  end

  def new
    @items = Items.new
  end

  def edit
  end

  def show
  end

  private
  def items_params
    params.require(:items).permit(:name, :image, :text)
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
