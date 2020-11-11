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
     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
