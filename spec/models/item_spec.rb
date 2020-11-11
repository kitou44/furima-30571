require 'rails_helper'
describe Item do
  before do
  @items = FactoryBot.build(:item)
  end

context '商品出品ができる時' do
    it '' do
    end
  end
  
  it "販売価格は半角数字のみ保存可能であること" do
    @items.price  = 300
    @items.valid?
   expect(@items.errors.full_messages).to include("Size can't be blank", "User can't be blank", "Description is not a number", "Shopping cost must be other than 1", "Price must be greater than 300")
    end

it "商品名が必須であること" do
  @items.name = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Name can't be blank")
end

context '商品出品ができない時' do
  it '' do
  end
end

it "商品名の説明が必須であること" do
  @items.description = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Description can't be blank")
end

it "カテゴリーの情報が必須であること" do
  @items.category_id = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Category can't be blank")
end

it "商品の状態の情報が必須であること" do
  @items.condition_id = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Condition can't be blank")
end

it "配送料の負担配送料の負担についての情報が必須であること" do
  @items.shopping_cost_id = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Shopping cost can't be blank")
end

it "発送元の地域についての情報が必須であること" do
  @items.trading_status_id = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Trading status can't be blank")
end

it "発送までの日数についての情報が必須であること" do
  @items.trading_status_id  = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Trading status can't be blank")
end

it "価格についての情報が必須であること" do
  @items.price  = ''
  @items.valid?
 expect(@items.errors.full_messages).to include("Price can't be blank")
end

it "価格の範囲が、¥9,999,999以上の場合、登録できない" do
  @items.price = 10000000
  @items.valid?
 expect(@items.errors.full_messages).to include("Price must be less than 9999999")
end

it "価格の範囲が、¥300以下の場合、登録できない" do
  @items.price  = 299
  @items.valid?
 expect(@items.errors.full_messages).to include("Price must be greater than 300")
end

end
