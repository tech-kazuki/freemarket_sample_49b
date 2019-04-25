FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    first_name            {"彩"}
    family_name_katakana  {"ヤマダ"}
    first_name_katakana   {"アヤ"}
    birthday_year         {"1990"}
    birthday_month        {"3"}
    birthday_date         {"3"}
  end

end