# アプリケーション名
- furima

# アプリケーション概要
- テックキャンプの最終課題にて作成したアプリケーション(フリーマーケットサービス)。
- メルカリの様に出品したい商品の画像、説明、カテゴリー、金額などを入力し、出品。
- クレジットカード決済代行サービス(PAY.JP)を使用して擬似的な購入のやり取りが行える。

# 利用方法
- トップページのヘッダーからユーザーの新規登録を行う。
### ユーザー1(出品者)
- 出品するボタンから内容(商品画像、商品名、商品の説明、商品の詳細、配送について、販売価格)を入力して出品する。
### ユーザー2(購入者)
- 出品一覧から気に入った商品を選択。
- 購入画面からクレジットカード情報、配送先を入力して購入する。


# 実装機能
### トップページ

[![Image from Gyazo](https://i.gyazo.com/8a67cf143765064753abeba59adfc0ec.gif)](https://gyazo.com/8a67cf143765064753abeba59adfc0ec)

### ユーザー新規登録機能
[![Image from Gyazo](https://i.gyazo.com/50a4586ed06ddc74d30f6c9d28570d2b.gif)](https://gyazo.com/50a4586ed06ddc74d30f6c9d28570d2b)

### ログイン機能
[![Image from Gyazo](https://i.gyazo.com/795c1846c1b5487a86d2e33bc576ebaa.gif)](https://gyazo.com/795c1846c1b5487a86d2e33bc576ebaa)

### 商品出品機能
[![Image from Gyazo](https://i.gyazo.com/d20f93afcdb953a635c2740c0fbc7d83.gif)](https://gyazo.com/d20f93afcdb953a635c2740c0fbc7d83)

### 商品購入機能
[![Image from Gyazo](https://i.gyazo.com/0d27998d9d66b8e74a60af255ce2d314.gif)](https://gyazo.com/0d27998d9d66b8e74a60af255ce2d314)

# テーブル設計
## users テーブル
| Column               | Type   | Options                      |
| ------------------   | ------ | ---------------------------- |
| email                | string | null: false   unique: true   |
| encrypted_password   | string | null: false                  |
| nickname             | string | null: false                  |
| birthday             | date   | null: false                  |
| family_name          | string | null: false                  |
| first_name           | string | null: false                  |
| family_name_kana     | string | null: false                  |
| first_name_kana      | string | null: false                  |



### Association
- has_many :items
- has_many :orders


## items テーブル
| Column           | Type    | Options                        |
| -----------------| ------- | ------------------------------ |
| name             | string  | null: false                    |
| description      | text    | null: false                    |
| category_id      | integer | null: false                    |
| condition_id     | integer | null: false                    |
| shipping_cost_id | integer | null: false                    |
| prefecture_id    | integer | null: false                    |
| scheduled_day_id | integer | null: false                    |
| price            | integar | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one  :address

## addresses テーブル
| Column        | Type      | Options                        |
| --------------| --------  | ------------------------------ |
| post_code     | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                     |
| phon_number   | string    | null: false                    |
| order         | references| null: false, foreign_key: true |

### Association
- belongs to :order