へんこう
# README
​
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|user_image|string|null: false|
|point|integer|null: false|
|birthday|integer|null: false|
|profile|text||
|provider|string||
|uid|string||
​
### Association
- has_many :credits, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :address, dependent: :delete
​
​
## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
​
### Association
- belongs_to :user
​
​
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|city_block|string|null: false|
|building|string||
|tel_number|integer|unique: true|
|user|reference|null: false, foreign_key: true|
​
### Association
- belongs_to :user
​
​
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|description|text|null: false|
|item_status|references|null: false, foreign_key: true|
|sale_status|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|delivery_status|references|null: false, foreign_key: true|
|prefecture|text|null: false|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
​
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :item_status
- belongs_to :sale_status
- belongs_to :delivery_status
- belongs_to :category
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
​

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
​
### Association
- belongs_to :user
- belongs_to :item
​
​
## item_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
​
### Association
- has_many :items
​
​
## sale_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
​
### Association
- has_many :items

​
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|null: false|
​
### Association
- bolongs_to :item
​
​
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|
​
### Association
- bolongs_to :item
- bolongs_to :user
​
​
## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
​
### Association
- has_many :items
​
​
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
​
### Association
- has_many :items
​
​
## delivery_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
​
### Association
- has_many :items
​
​
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|
​
### Association
- has_many :items
- has_ancestry