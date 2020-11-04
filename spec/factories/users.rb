FactoryBot.define do
  factory :user do
    nickname {"abeabe"}
    email {"kkk@gmail.com"}
    password {"1a1a1a1"}
    password_confirmation {"1a1a1a1"}
    family_name {"木藤"}
    first_name{"正臣"}
    family_name_kana{"カタカナ"}
    first_name_kana{"カタカナ"}
    birthday{"2020-02-02"}
  end
end
