# テーブル設計

## users テーブル

| Column       |  Type    |  Options    |
| ------------ | -------- | ----------- |
| nickname     | string   | null: false |
| email        | string   | null: false |
| password     | string   | null: false |
| name         | string   | null: false |
| name_reading | string   | null: false |
| birthday     | string   | null: false |

### Association

- has_one :addresses
- has_many :items 

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| name    | string     | null: false                    |
| text    | string     | null: false                    |
| state   | string     | null: false                    |
| class   | string     | null: false                    |
| pay     | string     | null: false                    |
| area    | string     | null: false                    |
| date    | string     | null: false                    |
| price   | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user