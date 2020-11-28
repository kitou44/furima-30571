class OrdersController < ApplicationController

  def index
    @order = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderDestination.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render action: :index
    end

  end
private
  def order_params
    params.require(:order_destination).permit(:prefecture_id, :city, :post_code, :address,:building_name, :phone_number)
    .merge(item_id: params[:item_id],user_id: current_user.id)
    params.require(:order_destination).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_01427de299d21ad8ca9c4594"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def address_params
    params.require(:address).permit(:prefecture_id, :city, :post_code, :address, :building_name, :phone_number)
    .merge(item_id: params[:item_id],user_id:  current_user.id)
  end
end
