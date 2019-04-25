FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    encrypted_password    {Faker::Number.number(6)}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_katakana  {Faker::Name.name}
    first_name_katakana   {Faker::Name.name}
    birthday_year         {Faker::Number.number(4)}
    birthday_month        {Faker::Number.number}
    birthday_date         {Faker::Number.number}
  end

end