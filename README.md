## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|not null|
|email|string|not null,unique|
|password|string|not null|
|first_name|string|not null|
|last_name|string|not null|
|birthday|integer|not null|

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|not null|
|explanation|text|not null|
|price|integer|not null|
|category|string|not null|
|condition|string|not null|
|area|string|not null|
|estimated_shipping|string|not null|
|user|references|not null, foreign key|
|shipping_cost|integer|not null|
<!-- imageはimagemagickで追加 -->

## purchase_recordsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|not null|
|expiration_date|integer|not null|
|user|references|not null, foreign key|
|item|references|not null, foreign key|

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|not null|
|prefecture|string|not null|
|municipalities|string|not null|
|address|string|not null|
|building_address|string||
|phone_number|string|not null|