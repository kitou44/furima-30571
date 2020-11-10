FactoryBot.define do
  factory :item do
   name {"photo"}
   description{"Valuable products"}
   size{"mediuam"}
   category_id{"hobby"}
   user_id{"nil"}
   condition_id{"Brand new"}
   price{"300"}
   trading_status_id{"Buyer burden"}
   prefecture_id{"hiroshima"}
   shopping_cost_id{"Shipping fee included"}
  end
end
