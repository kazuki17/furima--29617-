# README

# デーブル設計




## users テーブル
| Column                | Type   | Options     |
 ----------------------- -------- -------------
| nickname              | string | null: false |
| email                 | string | null: false |
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
| Column                    | Type    | Options       |
 --------------------------- --------- ----------------
| name                      | string  |   null: false |
| text                      | string  |   null: false |
| category                  | string  |   null: false |
| sales_status_id           | inetger |   null: false |
| shipping_fee_status_id    | integer |   null: false |
| prefecture_id             | integer |   null: false |
| scheduled_delivery_id     | integer |   null: false |
| price                     | integer |   null: false |
| user_id                      | string  |  foreign_key: true |



### Association
- has_one :buy
- belongs_to :user

## buys テーブル

| Column                | Type    | Options        |
 ----------------------- -------- ----------------
| postal_code_id        | integer | null: false    |
| prefecture_id         | integer | null: false    |
| city                  | string  | null: false    |
| addresses             | string  | null: false    |
| building              | string  |
| phone_number          | string  | null: false    |
| user_id               | string  |foreign_key: true |

### Association
- has_one :item
- belongs_to :user


### purchase_historys
| Column                | Type    | Options           |
-----------------------  -------- --------------------
| item_id              | string  |  foreign_key: true |
| user_id              | string  |  foreign_key: true |