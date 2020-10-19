# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Column | Type         | Options              |
| ------ | ------------ | -------------------- |
| name   | string       | null: false          |
| email  | string       | null: false          |

### Association
- has_many :items
- has_many :comments

## itemsテーブル

| Column | Type         | Options                        |
| ------ | ------------ | -------------------------------|
| name   | string       | null: false                    |
| price  | integer      | null: false                    |
| status | text         | null: false                    |
| user   | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column | Type         | Options                       |
| ------ | ------------ | ------------------------------|
| text   | text         | null:false                    |
| user   | references   | null:false, foreign_key: true |
| item   | references   | null:false, foreign_key: true |

### Associationテーブル

- belongs_to :user
- belongs_to :item