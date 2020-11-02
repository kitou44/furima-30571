FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    family_name {family_name}
    first_name{first_name}
    family_name_kana{family_name_kana}
    first_name_kana{first_name_kana}
    birthday{birthday}
  end
end
