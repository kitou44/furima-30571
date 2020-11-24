class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :order, :postal_code, :prefecture_id, :city, :building, :phone_number, :address

  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :building, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    Order.create(item_id: item_id, user_id:user_id)
    Address.create(order_history: order_history, postal_code: postal_code, prefecture_id: prefecture_id, 
    city: city,building: building, phone_number: phone_number)
  end
end
