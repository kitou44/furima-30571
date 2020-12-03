class OrdersController < ApplicationControlle
  before_action :find_item, only: [:creat, :index]

  def index
    @order = OrderDestination.new
    return redirect_to root_path if @item.user_id == current_user.id || @item.order!= nil
  end

  def create
    @order = OrderDestination.new(order_params)
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
    .merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'             
    )
  end
  def find_item
    @item = Item.find(params[:id])
  end
end