# アプリ名
farm-deli

# 概要
ユーザー（生産者）は農園紹介ページの作成、編集、削除ができます。また商品の出品、編集、削除や、農園に関する投稿、編集、削除ができます。  
ユーザー（購入者）は商品の購入と、農園紹介ページへのコメントができます。

# 制作背景
健康や、環境保護への意識の高い２０代〜４０代男女の、有機野菜を手軽にインターネットで購入したい、素性の分かる農家さんから直接購入したいというニーズを解決するためにこのアプリを作りました。

# 本番環境
heroku(アプリケーション完成後はAWSでデプロイ予定です)
[アプリケーションへのリンク](https://farm-deli.herokuapp.com/)

# アカウント
### 認証ID/Pass
ID: admin
Pass: 2222

### テスト用アカウント
#### 購入者用
メールアドレス:apple@apple
パスワード:111aaa
#### 生産者用
メールアドレス:sample@sample.com
パスワード:111aaa

# 利用方法
## 購入者
トップページ上部の左側にあるお客様新規登録ボタンをクリック→新規登録ページに移動→必要事項を入力すると登録完了
ログイン後は農園ページへのいいね（親指を上げているボタンクリック）、いいねをした農園一覧表示、農園へのコメント、商品の購入ができます。
[^1]: 農園へのコメント機能、商品の購入機能はまだ実装していません。
## 生産者
トップページ上部右側にある生産者様新規登録ボタンをクリック→新規登録ページに移動→必要事項を入力すると登録完了
ログイン後は農園ページの作成(1農園まで)・編集・削除、商品の出品・編集・購入履歴のない商品については削除ができます。また、農園ページに紐づくツイートの投稿ができます。
[^1]: ツイートの投稿機能、商品の編集・削除機能はまだ実装していません。

# 使用技術
HTML / CSS / Ruby / Ruby on Rails / Javascript / MySQL / GitHub / heroku / Visual Studio Code / Trello / (AWS予定)

# 実装済機能
[ユーザー管理機能(購入者、生産者別管理)](https://user-images.githubusercontent.com/68994139/94008805-8ab66e00-fdde-11ea-9a02-5d92a1a1bd44.gif)

[商品出品機能](https://user-images.githubusercontent.com/68994139/94009015-cf420980-fdde-11ea-824a-b7055a35341d.gif)

[農園紹介機能](https://user-images.githubusercontent.com/68994139/94008950-ba657600-fdde-11ea-8c3e-ed5c57dd33cf.gif)

[タグ付機能]
(https://user-images.githubusercontent.com/68994139/94009093-f0a2f580-fdde-11ea-8310-a0c4196576b9.gif)

[いいね機能]
(https://user-images.githubusercontent.com/68994139/94008894-a883d300-fdde-11ea-80b2-f6c1eab5186c.gif)

# 実装予定の機能
商品編集・削除機能
コメント機能
ツイート機能
商品購入機能

# テーブル設計
[ER図リンク Lucidchart](https://app.lucidchart.com/documents/view/4e0160f5-9897-4f08-a086-dbcd303cdcad/0_0#?folder_id=home&browser=icon)

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
- has_one  :farm

## farms テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| description      | text       | null: false                    |
| feature          | text       | null: false                    |
| farmer           | references | null: false, foreign_key: true |
*imagesはActiveStorageで紐付けます*

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

### Association
- belongs_to :user
- belongs_to :farm

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