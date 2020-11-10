class Genre < ActiveHash::Base
  self.data = [
    { id: 1, category: 'カテゴリー' },
    { id: 2, user: 'お客' },
    { id: 3, condition: '状態' },
    { id: 4, trading_status: '取引地位' },
    { id: 5, prefecture: '県' },
    { id: 6, shopping_cost: '輸送費' },
  
  ]
  include ActiveHash::Associations
  has_many :articles

  end