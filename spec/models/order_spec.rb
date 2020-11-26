require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @order = FactoryBot.build(:order_destination)
  end

  describe '購入作成' do
    context '内容に問題がない' do
  it "addressとtokenがあれば保存ができること" do
    expect(@order).to eq true
  end



  it "配送先の郵便番号が空では登録できないこと" do
    @order.Post_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include(" Post_code can't be blank")
  end

  it "配送先の都道府県が空では登録できないこと" do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include(" prefecture_id can't be blank")
  end

  it "配送先の市町村が空では登録できないこと" do
    @order.City = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it "配送先の番地が空では登録できないこと" do
    @order.Address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end

  it "配送先の電話番号が空では登録できないこと" do
    @order.Phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone_number can't be blank")
  end
end
end
end