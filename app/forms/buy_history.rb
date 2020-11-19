class BuyHistory 
  
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :addresses, :building, :phone_number, :user_id, :item_id, :prefecture_id
  attr_accessor :token

 with_options presence: true do

      validates :token

      validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/,message: '7桁の数字を入力してください'}
      validates :city  
      validates :addresses
      validates :phone_number
      validates :user_id
      validates :item_id
 end
    
      with_options numericality: { other_than: 1 } do
       validates :prefecture_id
     end


    def save
      # 商品の情報を保存し、「user」という変数に入れている
     user = PurchaseHistory.create!(user_id: user_id, item_id: item_id )
      # 住所の情報を保存
     Buy.create!(postal_code: postal_code, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_history_id: user.id )
    end

end
