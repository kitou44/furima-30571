class Item < ApplicationRecord
  has_many :items_users
  has_many :users, through: :room_users
end
