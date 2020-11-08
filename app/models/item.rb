class Item < ApplicationRecord
  has_many :items_users
  has_many :users, through: :items_users

  validates :items, presence: true
end
