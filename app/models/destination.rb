class Destination < ApplicationRecord
  attr_accessor :order_history, :prefecture_id, :city, :post_code, :address, :building_name, :phone_number 
  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  def save
    user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    Address.create(order_history: order_history, post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, user_id: user.id, phone_number :phone_number)
    Card.create(price: price, user_id: user.id)
  end
end