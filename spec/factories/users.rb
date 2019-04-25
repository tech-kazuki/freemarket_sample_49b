FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Number.number(6)}
    password_confirmation {Faker::Number.number(6)}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_katakana  {"ヤマダ"}
    first_name_katakana   {"アヤ"}
    birthday_year         {Faker::Number.number(4)}
    birthday_month        {Faker::Number.number}
    birthday_date         {Faker::Number.number}
  end

end