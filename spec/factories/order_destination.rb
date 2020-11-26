FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    order{"写真"}
    prefecture_id{1}
    city{"横浜市緑区"}
    post_code{"123-4567"}
    address{"青山1-1-1"}
    phone_number{"09012345678"}
  end
end