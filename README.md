# アプリ名
farm-deli

# 概要
ユーザー（生産者）は農園紹介ページの作成、編集、削除ができます。また商品の出品、編集、削除や、農園に関する投稿、編集、削除ができます。  
ユーザー（一般）は商品の購入と、農園紹介ページへのコメントができます。

# 本番環境

# 制作背景
健康、環境保護への意識の高い２０代〜４０代男女の、有機野菜を手軽にインターネットで購入したい、顔の見える農家さんから購入したいというニーズを解決するためにこのアプリを作りました。

# DEMO

# 使用技術
Ruby / Ruby on Rails / Javascript / MySQL / GitHub / AWS / Visual Studio Code / Trello

# テーブル設計

## users テーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| nickname       | string  | null: false               |
| email          | string  | null: false, unique: true |
| password       | string  | null: false               |
| last_name      | string  | null: false               |
| first_name     | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birth_date     | date    | null: false               |

### Association
- has_many :favorites
- has_many :farms, through: :favorites
- has_many :orders
- has_many :comments

## farmers テーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| nickname       | string  | null: false               |
| email          | string  | null: false, unique: true |
| password       | string  | null: false               |
| last_name      | string  | null: false               |
| first_name     | string  | null: false               |
| last_name_kana | string  | null: false               |
| first_name_kana| string  | null: false               |
| birth_date     | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- has_one  :farm

## farms テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| description      | text       | null: false                    |
| feature          | text       | null: false                    |
| farmer           | references | null: false, foreign_key: true |
*imageはActiveStorageで紐付けます*

### Association
- belongs_to :farmer
- has_many :favorites
- has_many :users, through: :favorites
- has_many :comments
- has_many :tweets
- has_many :farm_tags
- has_many :tags, through: :farm_tags

## favorites テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| farm             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :farm

## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| farm             | references | null: false, foreign_key: true |
| farmer           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :farm
- belongs_to :farmer

## tweets テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| content          | text       | null: false                    |
| farm             | references | null: false, foreign_key: true |

### Association
- belongs_to :farm

## tags テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | string     | null: false                    |

### Association
- has_many :farm_tags
- has_many :farm, through: :farm_tags
- has_many :items


## farm_tags テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| farm             | references | null: false, foreign_key: true |
| tag              | references | null: false, foreign_key: true |

### Association
- belongs_to :farm
- belongs_to :tag


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| ship_expense_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| period_id       | integer    | null: false                    |
| price           | integer    | null: false                    |
| farmer          | references | null: false, foreign_key: true |
*imageはActiveStorageで紐付けます*

### Association
- belongs_to :farmer
- has_many :orders

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| item_count       | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block_number  | string     | null: false                    |
| building      | string     | default: ""                    |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order