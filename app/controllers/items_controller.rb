class ItemsController < ApplicationController
  #before_action :set_items, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_items, only: [:edit, :show,:update, :destroy]
  before_action :find_item, only: :order

  def index
    @items = Item.all.order(created_at: :desc)
  end
  
  def order # 購入する時のアクションを定義
    redirect_to new_card_path and return unless current_user.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
     amount: @item.price, # 商品の値段
     customer: customer_token, # 顧客のトークン
     currency: 'jpy' # 通貨の種類（日本円）
     )
     ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する
     redirect_to root_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    unless current_user == @item.user
     redirect_to root_path
    end
  end
 
 def update
  if @item.update(items_params)
     redirect_to item_path(@item)
  else
     render :edit
  end
 end



  private

  def items_params
   params.require(:item).permit(:image,:name, :description, :category_id,  :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id ).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end

end

