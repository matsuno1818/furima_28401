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

- has_many :purchas
- has_many :item

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| name    | string     | null: false                    |
| text    | text       | null: false                    |
| price   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## purchases テーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :address