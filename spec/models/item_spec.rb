require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @items = FactoryBot.build(:item , user_id: user.id)
    @items.image = fixture_file_upload('/sample.png', 'image/png')
  end

  describe '商品作成' do
    context '内容に問題がない' do
      it '全て正常' do
        expect(@items.valid?).to eq true
      end
    end

    context '内容に問題がある' do
      it "商品名が必須であること" do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end

      it "商品名の説明が必須であること" do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end

      it '画像が必須であること' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end

      it "カテゴリーの情報が1以外であること" do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態の情報が1以外であること" do
        @items.condition_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担配送料の負担についての情報が1以外であること" do
        @items.shopping_cost_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Shopping cost must be other than 1")
      end

      it "発送元の地域についての情報が1以外であること" do
        @items.prefecture_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数についての情報が1以外であること" do
        @items.trading_status_id  = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Trading status must be other than 1")
      end

      it "価格についての情報が必須であること" do
        @items.price  = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end

      it "価格の範囲が、¥9,999,999以上の場合、登録できない" do
        @items.price = 10000000
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格の範囲が、¥300以下の場合、登録できない" do
        @items.price  = 200
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end
      
      it "販売価格は半角数字のみ保存可能であること" do
        @items.price  = '３００'
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
