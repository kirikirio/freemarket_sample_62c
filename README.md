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


<!-- merukari DB設計 -->
<!-- usersテーブル -->
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image_url|string||
|point|integer|null: false|
|birthday|integer|null: false|
|profile|text||
|postal_code|references|null: false, foreign_key: true|
|prefecture|references|null: false, foreign_key: true|
|city|string||
|city_block|string||
|building|string||

<!-- Association -->
- has_many :credits, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :sns_credentials, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :postal_code
- belongs_to :prefecture
- has_one :address, dependent: :delete


<!-- creditsテーブル -->
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

<!-- Association -->
- belongs_to :user


<!-- sns_credentialsテーブル -->
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user|reference|foreign_key: true|

<!-- Association -->
- belongs_to user


<!-- postalcodesテーブル -->
|Column|Type|Options|
|------|----|-------|
|postal_code|string|unique: true|

<!-- Association -->
- has_many :users
- has_many :addresses


<!-- addressesテーブル -->
|Column|Type|Options|
|------|----|-------|
|postal_code|reference|null: false, foreign_key: true|
|prefecture|reference|null: false, foreign_key: true|
|city|string|null: false|
|city_block|string|null: false|
|building|string||
|tel_number|integer|unique: true|
|user|reference|null: false, foreign_key: true|

<!-- Association -->
- belongs_to :user
- belongs_to :postal_code
- belongs_to :prefecture


<!-- itemsテーブル -->
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|discription|text|null: false|
|item_status|references|null: false, foreign_key: true|
|sale_status|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|shipping_status|references|null: false, foreign_key: true|
|prefecture|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

<!-- Association -->
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :item_status
- belongs_to :sale_status
- belongs_to :prefecture
- belongs_to :shipping_status
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :categories, through: :items_categories, dependent: :destroy


<!-- commentsテーブル -->
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

<!-- Association -->
- belongs_to :user
- belongs_to :item


<!-- item_statusesテーブル -->
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

<!-- Association -->
- has_many :item


<!-- sale_statusesテーブル -->
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

<!-- Association -->
- has_many :items


<!-- prefectureテーブル -->
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false, unique: true|

<!-- Association -->
- has_many :items
- has_many :users
- has_many :addresses


<!-- items_categoriesテーブル -->
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

<!-- Association -->
- belongs_to :item
- belongs_to :categories

<!-- imagesテーブル -->
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|null: false|

<!-- Association -->
- bolongs_to item


<!-- likesテーブル -->
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|

<!-- Association -->
- bolongs_to item
- bolongs_to user


<!-- sizesテーブル -->
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

<!-- Association -->
- has_many :items


<!-- brandsテーブル -->
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|

<!-- Association -->
- has_many :items


<!-- shipping_statusesテーブル -->
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

<!-- Association -->
- has_many :items


<!-- categoriesテーブル -->
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

<!-- Association -->
- has_many :items