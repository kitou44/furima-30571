FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    order {"写真"}
    prefecture_id {2}
    city {"横浜市緑区"}
    post_code {"123-4567"}
    address {Faker::Address}
    phone_number {"09012345678"}
    building_name{"建物ビル"}
  end
end