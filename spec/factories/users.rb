FactoryBot.define do
  factory :user do
    nickname            {Faker::Name.initials(number: 2)}
    email               {Faker::Internet.free_email}
    password              {"テスト"}
    password_confirmation {"テスト"}
    last_name             {"テスト"}
    first_name            {"テスト"}
    last_name_kana        {"テスト"}
    first_name_kana       {"テスト"}
  end
end
