FactoryBot.define do
  factory :item do
   name {1}
   description{1}
   category_id{1}
   condition_id{1}
   price{300}
   trading_status_id{1}
   prefecture_id{34}
   shopping_cost_id{1}
   association :user
  end
end
