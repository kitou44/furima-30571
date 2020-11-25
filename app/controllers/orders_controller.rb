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
    @order = OrderDestination.new(order_params)
    if @order.valid?
       @order.save
       redirect_to action: :index
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end
private
  def order_params
    params.require(:order_destination).permit(:prefecture_id, :city, :postal_code, :address,:building, :phone_number).merge(item_id: params[:item_id])
  end

  def address_params
    params.require(:address).permit(:prefecture_id, :city, :postal_code, :address,:building, :phone_number).merge(item_id: params[:item_id])
  end
end
