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
|Column|Type|Options|
|---------|-----|---------|
|nickname|string|null: false|
|Email|string|null: false, unique: true|
|family_name|string|null: false |
|first_name|string|null: false |
|family_name_katakana|string||
|first_name_katakana|string|null: false |
|birthday_year|string|null: false |
|birthday_month|string|null: false |
|birthday_date|string|null: false |
|image|string||
|profile|text||

### Association
- has_one :address
- has_one :card
- has_many :evaluations
- has_many :points
- has_many :todos


## addressテーブル
|Column|Type|Options|
|---------|-----|---------|
|postal_code|string|null: false |
|prefecture|string|null: false, foreign_key: true|
|city|string|null: false |
|building|string||
|phone_number|string||
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|---------|-----|---------|
|number|string|null: false |
|valid_month|string|null: false |
|valid_year|string|null: false |
|security_number|string|null: false |
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user

## evaluationテーブル
|Column|Type|Options|
|---------|-----|---------|
|evaluation_status|string||
|comment|text||
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belings_to :product


## pointテーブル
|Column|Type|Options|
|---------|-----|---------|
|point|integer|null: false |
|valid|string|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user

## ToDoテーブル

|todo|text|null: false |
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user


## productsテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false, index: ture|
|price|integer|null: false |
|description|text||
|category_id|integer|foreign_key: true |
|product_state|string||
|burden_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|prefecture|string|null: false|
|how_long|string||
|how_ship|string||
|brand_id|integer|foreign_key: true|
|availability|string||
|user_id|integer|foreign_key: true|

### Association
- has_many :likes
- has_many :comments
- has_many :images
- has_one :category
- has_one :burden
- has_one :brand
- belongs_to :user

## categorysテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|
|ancestry|string||

### Association
- belongs_to :product


## category_parentテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product


## category_childテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product


## burdenテーブル
|Column|Type|Options|
|---------|-----|---------|
|burden|string|null: false|

### Association
- belongs_to :product


## brandテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product


## likeテーブル
|Column|Type|Options|
|---------|-----|---------|
|product_id|integer|foreign_key: true |
|user_id|integer|foreign_key: true |

### Association
- belongs_to :product
- belongs_to :user

## commentテーブル
|Column|Type|Options|
|---------|-----|---------|
|comment|text|null: false|
|product_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## imageテーブル
|Column|Type|Options|
|---------|-----|---------|
|image|string|null:false|
|product_id|integer|foreign_key:true|

### Association
- belongs_to :product



