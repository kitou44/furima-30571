class OrderDestination 
  def save
    Order.create(item_id: item_id, user_id:user_id)
    Address.create(order_history: order_history, post_code: post_code, prefecture_id: prefecture_id, 
    city: city,building_name: building_name, user_id: user_id, phone_number :phone_number)
  end
end
