FactoryBot.define do
  factory :item do
     name                   {"テスト"}
     text                   {"テスト"}
     category_id            {1} 
     sales_status_id        {1}
     shipping_fee_status_id {1}   
     prefecture_id          {1}
     scheduled_delivery_id  {1}
     price                  {1000}
     user_id                {1}
  end
end
