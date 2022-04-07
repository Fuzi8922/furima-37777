## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|

### Association
* has_many items
* has_many purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|prefecture_id|integer|null: false|
|estimated_shipping_id|integer|null: false|
|user|references|null: false, foreign key: true|
|shipping_cost_id|integer|null: false|

### Association
* has_one purchases_record
* belongs_to user

## purchase_recordsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign key: true|
|item|references|null: false, foreign key: true|

### Association
* has_one address
* belongs_to user
* belongs_to item

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building_address|string||
|phone_number|string|null: false|
|purchase_record|references|null: false, foreign key: true|

### Association
* belongs_to purchases_record