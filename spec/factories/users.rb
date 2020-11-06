FactoryBot.define do
  factory :user do
    nickname {"kazuo"}
    email {"kitou@lilac.ocn.ne.jp"}
    password {"88c3988c39"}
    password_confirmation {password}
    family_name {"木藤"}
    first_name{"和夫"}
    family_name_kana{"キトウ"}
    first_name_kana{"カズオ"}
    birthday{"1946-07-06"}
  end
end
