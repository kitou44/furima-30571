class OrdersController < ApplicationController

  def index
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order = Destination.new

  end

  def create
     # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order = Destination.new(order_parames)
  end
  
  def user_params
    @order = Destination.find(params[:id])
  end

private
  def order_params
    @destination = Destination.find(params[:id])
  end
end
