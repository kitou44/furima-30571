class OrdersController < ApplicationController

  def index
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order = OrderDestination.new
    # 購入する商品の情報
    # findメソッドやパラムスを使用して取得する
    @item = Item.find(params[:item_id])
  end

  def create
     # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    binding.pry
    @order = OrderDestination.new(order_params)
    
  end
  

private
  def order_params
    params.permit(:prefecture_id, :city, :post_code, :address,:building_name, :phone_number).merge(user_id: current_user.id)
  end
end
