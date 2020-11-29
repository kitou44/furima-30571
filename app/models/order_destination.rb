class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :order, :post_code, :prefecture_id, :city, :building_name, :phone_number, :address

  with_options presence: true do
    validates :token
    validates :city
    validates :post_code
    validates :address
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
  end
  
  def save
    order = Order.create(item_id: item_id, user_id:user_id)
    Destination.create(order_id: order.id, token: token, address: address, post_code: post_code, prefecture_id: prefecture_id, city: city,building_name: building_name, phone_number: phone_number)
  end
end