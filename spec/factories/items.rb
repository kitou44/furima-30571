FactoryBot.define do
  factory :item do
   name {"photo"}
   description{1}
   size{"mediuam"}
   category_id{1}
  #  user_id{"nil"}
   condition_id{1}
   price{300}
   trading_status_id{1}
   prefecture_id{34}
   shopping_cost_id{1}
   association :user
  end
end
