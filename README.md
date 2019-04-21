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
- has_one :payment
- has_many :evaluations
- has_many :points
- has_many :todos


## addressテーブル
|Column|Type|Options|
|---------|-----|---------|
|postal_code|string|null: false |
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false |
|building|string||
|phone_number|string||
|user_id|integer|foreign_key: true|

### Association
- has_one :prefecture
- belongs_to :user

## paymentテーブル
|Column|Type|Options|
|---------|-----|---------|
|card_number|string|null: false |
|valid_month|string|null: false |
|valid_year|string|null: false |
|security_number|string|null: false |
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user

## evaluationテーブル
|Column|Type|Options|
|---------|-----|---------|
|evaluation_status_id|integer|foreign_key: true|
|comment|text||
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belings_to :product
- has_one :status

## evaluation_statusテーブル
|Column|Type|Options|
|---------|-----|---------|
|status|string|null: false|

### Association
- belongs_to :evaluation

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

## prefectureテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :address
- belongs_to :product

## productsテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false, index: ture|
|price|integer|null: false |
|description|text||
|category_first_id|integer|foreign_key: true |
|category_second_id|integer|foreign_key: true |
|category_third_id|integer|foreign_key: true |
|product_state_id|integer|foreign_key: true |
|burden_id|integer|foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|how_long_id|integer|foreign_key: true |
|how_ship_id|integer|foreign_key: true |
|brand_id|integer|foreign_key: true |
|availability_id|integer|foreign_key: true |
|user_id|integer|foreign_key: true |

### Association
- has_many :likes
- has_many :comments
- has_many :images
- has_one :category_first
- has_one :category_second
- has_one :category_third
- has_one :product_state
- has_one :burden
- has_one :prefecture
- has_one :how_long
- has_one :how_ship
- has_one :brand
- has_one :availability
- belongs_to :user

## category_firstテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product



## category_secondテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product



## category_thirdテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product



## product_stateテーブル
|Column|Type|Options|
|---------|-----|---------|
|state|string|null: false|

### Association
- belongs_to :product


## burdenテーブル
|Column|Type|Options|
|---------|-----|---------|
|burden|string|null: false|

### Association
- belongs_to :product


## how_longテーブル
|Column|Type|Options|
|---------|-----|---------|
|how_long|string|null: false|

### Association
- belongs_to :product


## how_shipテーブル
|Column|Type|Options|
|---------|-----|---------|
|how_ship|string|null: false|

### Association
- belongs_to :product


## brandテーブル
|Column|Type|Options|
|---------|-----|---------|
|name|string|null: false|

### Association
- belongs_to :product


## availabilityテーブル
|Column|Type|Options|
|---------|-----|---------|
|availability|string|null: false|

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



