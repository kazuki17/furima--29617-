# README

# デーブル設計

## user テーブル

nickname,              null: false, 
email,                 null: false, 
encrypted_password     null: false,
reset_password_token   null: false,
reset_password_sent_at null: false,
last_name              null: false,
first_name             null: false,
last_name_kana         null: false,
first_name_kana        null: false, 
birth_date             null: false,
remember_created_at    null: false,

### Association
- has_many :item
- has_many :buy

## items テーブル

image        , null: false
name         , null: false
text         , null: false
item_category           , null: false
item_sales_status       , null: false
item_shipping_fee_status         , null: false
item_prefecture         , null: false
item_scheduled_delivery          , null: false

### Association
- has_one :buy
- belongs_to :user

## buy テーブル

card_number,    null: false
card_exp_month, null: false
card_exp_year,  null: false
card_cvc,       null: false
postal_code,    null: false
prefecture,     null: false
city,           null: false
addresses,      null: false
building,       null: false
phone_number,   null: false

### Association
- has_one :item
- belongs_to :user