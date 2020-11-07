class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :name         , null: false
      t.integer    :text         , null: false
      t.text       :item_category_id                    , null: false
      t.string     :item_sales_status_id                , null: false
      t.text       :item_shipping_fee_status_id         , null: false
      t.integer    :item_prefecture_id                  , null: false
      t.text       :item_scheduled_delivery_id          , null: false
      t.text       :user_id          , null: false
      t.timestamps
    end
  end
end
