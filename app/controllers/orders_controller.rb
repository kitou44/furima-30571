class OrdersController < ApplicationController

  def index
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order = OrderDestination.new

  end

  def create
     # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order = OrderDestination.new(order_parames)
  end
  

private
  def order_params
    params.permit().merge(user_id: current_user.id)
  end
end
