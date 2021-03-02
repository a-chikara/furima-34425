## users テーブル

| Column              | Type   | Options                   |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_katakana | string | null: false               |
| last_name_katakana  | string | null: false               |
| birthday            | date   | null: false               |




### Association
- has_many :products
- has_many :records


## products テーブル

| Column            | Type    | Options     |
|-------------------|---------|-------------|
| product_name      | string  | null: false |
| product_explain   | text    | null: false |
| category_id       | integer | null: false |
| product_status_id | integer | null: false |
| shipping_fee_id   | integer | null: false |
| prefectures_id    | integer | null: false |
| days_id           | integer | null: false |
| price             | integer | null: false |


### Association
- belongs_to :user
- has_one :record


## recordsテーブル
| Column           |  Type  | Options           |
|------------------|--------|-------------------|
| products_id      | string | foreign_key: true |
| users_id         | string | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :product
- has_one :personal_date

## personal_datesテーブル

| Column          |  Type   | Options     |
|-----------------|---------|-------------|
| postal_code     | string  | null: false |
| prefectures_id  | integer | null: false |
| city            | string  | null: false |
| address         | string  | null: false |
| building        | string  |             | 
| phone_number    | string  | null: false |


### Association
- belongs_to :record