FactoryBot.define do
  factory :user do
    nickname            {Faker::Name.initials(number: 2)}
    email               {Faker::Internet.free_email}
    password              {"u12dd4"}
    password_confirmation {"u12dd4"}
    last_name             {"テスト"}
    first_name            {"テスト"}
    last_name_kana        {"テスト"}
    first_name_kana       {"テスト"}
    birth_date          {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end