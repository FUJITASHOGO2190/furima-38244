# テーブル設計

## users テーブル
| Column               | Type   | Options                      |
| ------------------   | ------ | ---------------------------- |
| email                | string | null: false   unique: true   |
| encrypted_password   | string | null: false                  |
| nickname             | string | null: false                  |
| birthday             | string | null: false                  |
| family_name          | string | null: false                  |
| first_name           | string | null: false                  |
| family_name_kana     | string | null: false                  |
| first_name_kana      | string | null: false                  |



### Association
- has_many :items
- has_many :orders


## items テーブル
| Column        | Type    | Options                        |
| --------------| ------- | ------------------------------ |
| name          | string  | null: false                    |
| description   | text    | null: false                    |
| condition     | text    | null: false                    |
| shipping_cost | string  | null: false                    |
| sender        | string  | null: false                    |
| price         | integar | null: false                    |

### Association
- belongs_to :user
- belongs to :order


## orders テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items
- has_one  :address

## addresses テーブル
| Column        | Type      | Options                        |
| --------------| --------  | ------------------------------ |
| post_code     | string    | null: false                    |
| prefecture    | string    | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    | null: false                    |
| phon_number   | integar   | null: false                    |
| order         | reference | null: false, foreign_key: true |

### Association
- belongs_to :address
-