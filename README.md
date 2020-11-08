# README

# デーブル設計




## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_date            | date   | null: false |
| encrypted_password    | string | null: false |


### Association
- has_many :items
- has_many :buys

## items テーブル
| Column                    | Type    | Options           |
| ------------------------- | ------- | ----------------- |
| name                      | string  |   null: false     |
| text                      | text    |   null: false     |
| category_id               | integer |   null: false     |
| sales_status_id           | inetger |   null: false     |
| shipping_fee_status_id    | integer |   null: false     |
| prefecture_id             | integer |   null: false     |
| scheduled_delivery_id     | integer |   null: false     |
| price                     | integer |   null: false     |
| user_id                   | integer | foreign_key: true |



### Association
- has_one :buy
- belongs_to :user

## buys テーブル

| Column                | Type    | Options           |
| --------------------- | ------- | ----------------- |
| postal_code           | string  | null: false       |
| prefecture_id         | integer | null: false       |
| city                  | string  | null: false       |
| addresses             | string  | null: false       |
| building              | string  |                   |
| phone_number          | string  | null: false       |
| purchase_history_id   | ineger  | foreign_key: true |

### Association
- has_one :item
- belongs_to :user


### purchase_historys
| Column               | Type     | Options            |
| ---------------------| -------- | ------------------ |
| item_id              | integer  |  foreign_key: true |
| user_id              | integer  |  foreign_key: true |

### Association
- has_one :item
- belongs_to :user
- has_one :buy