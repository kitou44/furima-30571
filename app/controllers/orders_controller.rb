class OrdersController < ApplicationController

  def index
    @order = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderDestination.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      #binding.pry
       pay_item
       @order.save
       redirect_to root_path
    else
      #binding.pry
      render action: :index
    end

  end
private
  def order_params
    params.require(:order_destination).permit(:prefecture_id, :city, :post_code, :address,:building_name, :phone_number)
    .merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_01427de299d21ad8ca9c4594"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
