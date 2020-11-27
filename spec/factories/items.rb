FactoryBot.define do
  factory :item do
   name {Faker::Name.initials(number: 2)}
   description {"a"}
   category_id {2}
   condition_id {2}
   price {300}
   trading_status_id {2}
   prefecture_id {34}
   shopping_cost_id {2}
   association :user
   after(:build) do |image|
    image.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
  end
  end
end
