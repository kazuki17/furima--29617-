class Item < ApplicationRecord
   has_one_attached :image
    belongs_to :user

  with_options numericality: { other_than: 1 } do   
    validates :category_id           
    validates :sales_status_id        
    validates :shipping_fee_status_id
    validates :prefecture_id      
    validates :scheduled_delivery_id 
  end

   with_options presence: true do
    validates :name
    validates :text
    validates :category_id         
    validates :sales_status_id
    validates :shipping_fee_status_id       
    validates :prefecture_id      
    validates :scheduled_delivery_id  
    validates :price
    validates :user_id
   end 

   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category
   belongs_to_active_hash :sales_status
   belongs_to_active_hash :shipping_fee_status
   belongs_to_active_hash :prefecture
   belongs_to_active_hash :scheduled_delivery
   #空の投稿を保存できないようにする
   

   #選択が「--」のままになっていないか
   with_options numericality: { other_than: 1 } do
     validates :category_id
   end
end
