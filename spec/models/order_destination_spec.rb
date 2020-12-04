require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入作成' do
    context '内容に問題がない' do
      it "addressとtokenがあれば保存ができること" do
        expect(@order).to be_valid
      end
      it "建物名が空でも保存できること" do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある' do
    it "配送先の郵便番号が空では登録できないこと" do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end

    it "郵便番号はハイフン無しでは登録できないこと" do
      @order.post_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid", "Post code is invalid")
    end

    it "配送先の都道府県が1以外であること" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "配送先の都道府県が空では登録できないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "配送先の市町村が空では登録できないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "配送先の番地が空では登録できないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "配送先の電話番号が空では登録できないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号は12桁以上では登録できないこと" do
      @order.phone_number = "0909009900009"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it "電話番号はハイフンがあると登録できないこと" do
      @order.phone_number = "090-9009-9009"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end
  end

end
