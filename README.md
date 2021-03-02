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

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| product_name    | string  | null: false |
| product_explain | text    | null: false |
| category        | string  | null: false |
| product_status  | integer | null: false |
| shipping_fee    | integer | null: false |
| shipment_source | string  | null: false |
| days            | integer | null: false |
| price           | integer | null: false |
| seller          | string  | null: false |


### Association
- belongs_to :users
- has_one :records


## recordsテーブル
| Column           |  Type  | Options     |
|------------------|--------|-------------|
| buyer            | string | null: false |
| buy_product_name | string | null: false |

### Association
- belongs_to :users
- belongs_to :products
- has_one :personal_dates

## personal_datesテーブル

| Column       |  Type   | Options     |
|--------------|---------|-------------|
| postal_code  | string  | null: false |
| prefectures  | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| phone_number | integer | null: false |


### Association
- belongs_to :records