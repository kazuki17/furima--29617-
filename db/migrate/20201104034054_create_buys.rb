class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string   :card_number,    null: false
      t.string   :fcard_exp_month, null: false
      t.string   :card_exp_year,  null: false
      t.string   :card_cvc,       null: false
      t.string   :postal_code,    null: false
      t.string   :prefecture,     null: false
      t.string   :city,           null: false
      t.string   :addresses,      null: false
      t.string   :building,       null: false
      t.string   :phone_number,   null: false
      t.timestamps
    end
  end
end

