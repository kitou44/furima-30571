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
    if @order_destination.valid?
      @order_destination.save
      redirect_to action: :index
    else
      render action: :new
    end
  end
  

private
  def order_params
    params.require(:order_destination).permit(:prefecture_id, :city, :postal_code, :address,:building, :phone_number).merge(item_id: params[:item_id])
  end
end
