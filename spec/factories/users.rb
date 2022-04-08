FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana	      {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 20, max_age: 60)}
  end
end