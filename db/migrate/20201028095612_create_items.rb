class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :name,                         null: false
      t.text       :text,                         null: false
      t.inetger    :category_id,                  null: false
      t.inetger    :sales_status_id,              null: false
      t.inetger    :shipping_fee_status_id,       null: false
      t.integer    :prefecture_id,                null: false
      t.inetger    :scheduled_delivery_id,        null: false
      t.inetger    :price,                        null: false
      t.inetger    :user_id,                      foreign_key: true
      t.timestamps   
    end
  end
end
