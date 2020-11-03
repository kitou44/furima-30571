FactoryBot.define do
  factory :user do
    nickname {"abeabe"}
    email {"kkk@gmail.com"}
    password {"1a1a1a1"}
    password_confirmation {"1a1a1a1"}
    family_name {"kkk"}
    first_name{"kkkk"}
    family_name_kana{"カタカナ"}
    first_name_kana{"カタカナ"}
    birthday{"20200202"}
  end
end
