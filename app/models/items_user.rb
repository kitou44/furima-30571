class ItemsUser < ApplicationRecord
  belongs_to :items
  belongs_to :user
end
