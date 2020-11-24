class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :order, :post_code, :prefecture_id, :city, :building_name, :phone_number

  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :building_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    Order.create(item_id: item_id, user_id:user_id)
    Address.create(order_history: order_history, post_code: post_code, prefecture_id: prefecture_id, 
    city: city,building_name: building_name, phone_number: phone_number)
  end
end
