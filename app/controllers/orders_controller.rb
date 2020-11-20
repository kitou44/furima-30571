class OrdersController < ApplicationController

  def index
    @item = Item.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
