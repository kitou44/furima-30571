class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :order, :post_code, :prefecture, :city, :building_name, :phone_number, :address
  
  belongs_to :token
  belongs_to :city
  belongs_to :post_code
  belongs_to :address
  belongs_to :phone_number
  belongs_to :prefecture

  with_options presence: true do
    validates :token
    validates :city
    validates :post_code
    validates :address
    validates :phone_number
    validates :prefecture, numericality: { other_than: 1, message: 'must be other than 1' }
  end
  
  def save
    #binding.pry
    order = Order.create(item_id: item_id, user_id:user_id)
    Destination.create(order_id: order.id, address: address, post_code: post_code, prefecture_id: prefecture_id, 
    city: city,building_name: building_name, phone_number: phone_number)
  end
end