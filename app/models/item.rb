class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # validates :items, presence: true
  belongs_to :user,:description ,:category_id, :size, :user_id, :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id
  

  validates :name, :description ,:category_id, :size, :user_id, :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id,   presence: true
   

  validates :description ,:category_id, :condition_id, :trading_status_id, :prefecture_id, :shopping_cost_id, numericality: { other_than: 1 } 

  validates :price,

numericality: { only_integer: true,

greater_than: 300, less_than: 9999999

}

  validates :price,format: { with: /\A[0-9]+\z/ }
end
