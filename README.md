

## usersテーブル

| Column           | Type         | Options              |
| ---------------- | ------------ | -------------------- |
| nickname         | string       | null: false          |
| email            | string       | null: false          |
| password         | string       | null: false          |
| first_name       | string       | null: false          |
| first_name_kana  | string       | null: false          |
| last_name        | string       | null: false          |
| last_name_kana   | string       | null: false          |
| birthday         | date         | null: false          |


### Association
- has_many :items
- has_many :comments
- has_many :purchases

## itemsテーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | -------------------------------|
| name                | string       | null: false                    |
| price               | integer      | null: false                    |
| detail              | text         | null: false                    |
| category_id         | integer      | null: false                    |
| status_id           | integer      | null: false                    |
| shipment_source_id  | integer      | null: false                    |
| delivery_charge_id  | integer      | null: false                    |
| period_id           | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase

## commentsテーブル

| Column | Type         | Options                       |
| ------ | ------------ | ------------------------------|
| text   | text         | null:false                    |
| user   | references   | null:false, foreign_key: true |
| item   | references   | null:false, foreign_key: true |

### Associationテーブル

- belongs_to :user
- belongs_to :item


## shipping addressテーブル

| Column          | Type         | Options                       |
| --------------- | ------------ | ------------------------------|
| prefecture_id   | integer      | null: false                   |
| city            | string       | null: false                   |
| house_number    | string       | null: false                   |
| building        | string       |                               |
| post_code       | string       | null: false                   |
| phone_number    | string       | null: false                   |
| purchase        | references   | null: false, foreign_key: true|

### Association
- belongs_to :purchase

## purchaseテーブル
| Column          | Type         | Options                       |
| --------------- | ------------ | ------------------------------|
| user            | references   | null:false, foreign_key: true |
| item            | references   | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_address