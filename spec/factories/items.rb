FactoryBot.define do
  factory :item do
    id {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    item_category_id     {Faker::Lorem.sentence}
    item_sales_status_id {Faker::Lorem.sentence}
    item_shipping_fee_status_id {Faker::Lorem.sentence}
    item_prefecture_id          {Faker::Lorem.sentence}
    item_scheduled_delivery_id  {Faker::Lorem.sentence}
    association :user
  end
end