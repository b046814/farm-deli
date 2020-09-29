# アプリ名
### farm-deli

# 概要
- 有機農産物の通販アプリです。
ユーザーを消費者と生産者の２つのグループに分けて管理しています。  
ユーザー（生産者）は農園紹介ページの作成、編集、削除ができます。また商品の出品、編集、削除や、ユーザー（消費者）から質問やコメントがあればチャットができます。<br>
ユーザー（消費者）は商品の購入と、ユーザー（生産者）とチャットができます。

# 制作背景
健康や、環境保護への意識の高い２０代〜４０代男女の、有機野菜を手軽にインターネットで購入したい、素性の分かる農家さんから直接購入したいというニーズを解決するためにこのアプリを作りました。

# 本番環境
heroku(アプリケーション完成後はAWSでデプロイ予定です)  
[アプリケーションへのリンク](https://farm-deli.herokuapp.com/)

# アカウント
### 認証ID/Pass
ID: admin<br>
Pass: 2222

### テスト用アカウント
#### 購入者用
メールアドレス:sample@sample.com  
パスワード:111aaa
#### 生産者用
メールアドレス:apple@apple.com  
パスワード:111aaa

# 利用方法
## 消費者
トップページ上部の左側にあるお客様新規登録ボタンをクリック→新規登録ページに移動→必要事項を入力すると登録完了です。  
ログイン後は農園紹介ページへのいいね（親指を上げているボタンをクリック）と、いいねをした農園をマイページで一覧表示することができます。  
生産者(農園)とのチャットができます。農園紹介ページにチャットルーム作成ボタンがあります。チャットルームは１農園に対して１個だけ作成できます。作成したチャットルームの一覧はトップページ上部のチャットルーム一覧ボタンをクリックすると見ることができます。  
商品の購入ができます。商品の画像をクリックする→商品詳細ページ→購入数量を入力し、購入ページへ進むボタンを押す→購入ページで必要事項を入力すると購入できます。商品購入履歴はマイページ下部に表示されます。 

## 生産者
トップページ上部右側にある生産者様新規登録ボタンをクリック→新規登録ページに移動→必要事項を入力すると登録完了です。  
ログイン後は農園ページの作成(1農園まで)・編集・削除ができます。  
商品の出品・編集・購入履歴のない商品については削除ができます。  
また、購入者がチャットルームを作った場合には購入者とチャットができます。

# 使用技術
HTML / CSS / Ruby / Ruby on Rails / Javascript / MySQL / GitHub / heroku / Visual Studio Code / Trello / (AWS予定)

# 実装済機能
- ユーザー管理機能(購入者、生産者別管理)
![ユーザー管理機能gif](https://user-images.githubusercontent.com/68994139/94008805-8ab66e00-fdde-11ea-9a02-5d92a1a1bd44.gif)

- 商品出品機能
![商品出品機能gif](https://user-images.githubusercontent.com/68994139/94009015-cf420980-fdde-11ea-824a-b7055a35341d.gif)

- 農園紹介機能
![農園紹介機能gif](https://user-images.githubusercontent.com/68994139/94008950-ba657600-fdde-11ea-8c3e-ed5c57dd33cf.gif)

- タグ付機能
![タグ付機能gif](https://user-images.githubusercontent.com/68994139/94009093-f0a2f580-fdde-11ea-8310-a0c4196576b9.gif)

- いいね機能
![いいね機能gif](https://user-images.githubusercontent.com/68994139/94392621-c01edb00-0193-11eb-9ec6-2b72a6a9eea0.gif)

- 品目検索機能
![検索機能gif](https://user-images.githubusercontent.com/68994139/94102365-ef200e80-fe6c-11ea-929c-6d66e7cb492f.gif)

- チャット機能
![チャット機能gif](https://user-images.githubusercontent.com/68994139/94330649-68e90100-0001-11eb-9b08-7e61e737fbff.gif)

- 商品購入機能
![商品購入機能](https://user-images.githubusercontent.com/68994139/94392626-c2813500-0193-11eb-9ab9-de5320d03bcd.gif)

# 実装予定の機能
- 結合テストコード
- AWSでのデプロイ

# バージョン
ruby 2.6.5<br>
rails 6.0.3.3

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
- has_many :rooms,
- has_many :farmers, through: :rooms

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
- has_many :rooms
- has_many :users, through: :rooms

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

## rooms テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| farmer           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :farmer
- has_many :massages

## messages テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | text       | null: false                    | 
| id_user          | boolean    | null: false                    |
| room             | references | null: false, foreign_key: true |

### Association
- belongs_to :room

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