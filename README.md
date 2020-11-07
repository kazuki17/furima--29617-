# README

# デーブル設計




## user テーブル
| Column                | Type   | Options     |
 ----------------------- -------- -------------
| nickname,             | strong | null: false |
| email,                | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_date            | datetime  | null: false |
| remember_created_at   | datetime  | null: false |

### Association
- has_many :item
- has_many :buy

## items テーブル
| Column                | Type   | Options        |
 ----------------------- -------- ----------------
| name                   | string |   null: false |
| text                   | string |   null: false |
| category               | string |   null: false |
| sales_status           | string |   null: false |
| shipping_fee_status    | string |   null: false |
| prefecture             | string |   null: false |
| scheduled_delivery     | string |   null: false |
| price                  | string |   null: false |
| user_id                | string |  



### Association
- has_one :buy
- belongs_to :user

## buy テーブル

| Column                | Type   | Options        |
 ----------------------- -------- ----------------
| postal_code,          | string |   null: false
| prefecture,           | string |
| city,                 | string |
| addresses,            | string | 
| building,             | string |
| phone_number,         | string |    null: false

### Association
- has_one :item
- belongs_to :user


### Purchase history
| Column                | Type   | Options        |
| user_id               | strin  |  null: false
| item_id               | string |  null: false