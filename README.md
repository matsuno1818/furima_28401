# テーブル設計

## users テーブル

| Column             |  Type    |  Options    |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| password           | string   | null: false |
| family_name        | string   | null: false |
| familyname_reading | string   | null: false |
| first_name         | string   | null: false |
| firstname_reading  | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | string     | null: false                    |
| name     | string     | null: false                    |
| text     | text       | null: false                    |
| category | string     | null: false                    |
| state    | string     | null: false                    |
| delivery | string     | null: false                    |
| date     | integer    | null: false                    |
| price    | integer    | null: false                    |
| exhibitor| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchaser     | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one :purchase

## purchases テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| purchaser | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :address
- belongs_to :item