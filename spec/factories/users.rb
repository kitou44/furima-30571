FactoryBot.define do
  factory :user, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
  end
end
