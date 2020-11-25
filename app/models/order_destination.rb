class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :order, :postal_code, :prefecture_id, :city, :building, :phone_number, :address

  with_options presence: true do
    validates :city
    validates :postal_code
    validates :address
    validates :phone_number
  end
  
  def save
    Order.create(item_id: item_id, user_id:user_id)
    Address.create(order: order, postal_code: postal_code, prefecture_id: prefecture_id, 
    city: city,building: building, phone_number: phone_number)
  end
end