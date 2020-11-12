FactoryBot.define do
  factory :item do
   name {"あ"}
   description {"a"}
   category_id {2}
   condition_id {2}
   price {300}
   trading_status_id {2}
   prefecture_id {34}
   shopping_cost_id {2}
   association :user
  end
end
