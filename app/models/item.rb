class Item < ApplicationRecord
  

  
  # validates :items, presence: true
  belongs_to :user

  validates :name, :description ,:category_id, :size, :user_id, :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id,   presence: true
   

  

  validates :price,

numericality: { only_integer: true,

greater_than: 300, less_than: 9999999

}

  validates :shopping_cost_id,format: { with: /\A[0-9]+\z/ }
end
