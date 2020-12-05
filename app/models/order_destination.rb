class OrderDestination 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :post_code, :prefecture_id, :city, :building_name, :phone_number, :address

  with_options presence: true do
    validates :token
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
    #validates :building_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :user_id
    validates :item_id
  end
  
  def save
    order = Order.create(item_id: item_id, user_id:user_id)
    Destination.create(order_id: order.id, address: address, post_code: post_code, prefecture_id: prefecture_id, city: city,building_name: building_name, phone_number: phone_number)
  end
end