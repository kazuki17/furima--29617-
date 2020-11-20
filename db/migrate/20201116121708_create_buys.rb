class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string   :postal_code
      t.integer  :prefecture_id
      t.string   :city
      t.string   :addresses
      t.string   :building
      t.string   :phone_number
      t.integer  :purchase_history_id
      t.timestamps
    end
  end
end
