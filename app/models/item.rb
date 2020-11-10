class Item < ApplicationRecord
  has_many :items_users
  has_many :users, through: :items_users
  
  # validates :items, presence: true
  belongs_to :user

  validates :name, :description ,:category_id, :size, :user_id, :condition_id, :price, :trading_status_id, :prefecture_id, :shopping_cost_id,   presence: true
   

  

  validates :price,

numericality: { only_integer: true,

greater_than: 300, less_than: 999999999

}

  validates :shopping_cost_id,format: { with: /\A[A-Za-z]\w*\z/ }
end
