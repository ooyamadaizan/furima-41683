# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| prefecture_id    | integer    | null: false |
| shipping_days_id | integer    | null: false |
| price            | integer    | null: false |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| address_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address_line     | string     | null: false |
| building_name    | string     |
| phone_number     | string     | null: false |

### Association

- has_many :orders