FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password {'1a'+Faker::Internet.password(min_length: 8)}
    password_confirmation {'1a'+Faker::Internet.password(min_length: 8)}
    family_name {"木藤"}
    first_name {"和夫"}
    family_name_kana {"キトウ"}
    first_name_kana {"カズオ"}
    birthday{"1946-07-06"}
  end
end
