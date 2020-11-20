
FactoryBot.define do
  factory :buy_history do
    postal_code           { '222-2222' }
    city                  { '東京都' }
    addresses             { '3-2-10' }
    building               { '222222asdf' }
    phone_number           { 2222222222 }
    user_id                { 2 }
    prefecture_id          { 2 }
    item_id                { 2 }
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end