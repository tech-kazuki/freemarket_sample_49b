FactoryBot.define do

  factory :user do
    nickname              {'kazuki'}
    email                 {Faker::Internet.email}
    password              {'000000'}
    encrypted_password    {'000000'}
    family_name           {'佐藤'}
    first_name            {'太郎'}
    family_name_katakana  {'サトウ'}
    first_name_katakana   {'タロウ'}
    birthday_year         {'1990'}
    birthday_month        {'8'}
    birthday_date         {'2'}
  end
end