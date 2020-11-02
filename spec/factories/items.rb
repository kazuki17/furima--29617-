FactoryBot.define do
  factory :items do
    content {Faker::Lorem.sentence}
  end
end