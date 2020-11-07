class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :item_category, presence: true
  validates :item_sales_status_id, presence: true
  validates :item_shipping_fee_status_id, presence: true
  validates :item_prefecture_id, presence: true
  validates :item_scheduled_delivery_id, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category

  #空の投稿を保存できないようにする
  validates  :name, :item_category, presence: true

  #選択が「--」のままになっていないか
    with_options numericality: { other_than: 1 } do
    validates :item_category_id
  end

    #アソシエーションの定義
    belongs_to :user
    has_one    :buy

end
