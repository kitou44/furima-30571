class Order < ApplicationRecord
 belongs_to :user
 belongs_to :item
 has_one :destination
 attr_accessor :name, :description, :category_id, :user_id, :condition_id, :price, :trading_status_id, :prefecture_id
               :shopping_cost_id
end