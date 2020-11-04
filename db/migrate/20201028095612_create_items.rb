class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :image        , null: false
      t.text       :name         , null: false
      t.integer    :text         , null: false
      t.text       :item_category           , null: false
      t.string     :item_sales_status       , null: false
      t.text       :item_shipping_fee_status         , null: false
      t.integer    :item_prefecture         , null: false
      t.text       :item_scheduled_delivery          , null: false
      t.timestamps
    end
  end
end
