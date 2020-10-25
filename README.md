# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------------   | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day	       | date	  | null: false |


### Association

has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy
belongs_to :card dependent: :destroy

##  destinationテーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
|user_id	        | integer	  |null: false, foreign_key: true |
|post_code	      | integer	  |null: false                    |
|prefecture	      | integer	  |null: false                    |
|city	            | integer	  |null: false                    |
|address	        | integer	  |null: false                    |
|building_name	  | integer	  |                               |
|phone_number	    | integer   |null: false                    |

### Association

belongs_to :user


## category テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name	  | string | null: false |

### Association

has_many :products

## productテーブル

| Column        |	Type    |	Options                        |
| ------------- | ------- | -----------------------------  |
| name          | integer | null: false                    |
| price	        | integer	| null: false                    |
| description	  | integer	| null: false                    |
| status	      | integer	| null: false                    |
| size	        | integer	| null: false                    |


## Association

belongs_to_active_hash :prefecture


## Use_idテーブル

| Column        |	Type    |	Options                        |
| user_id       |	string	| null: false                    |
|product_id	    | integer	| null: false, foreign_key: true |

## Association

belongs_to :product

## Item_idテーブル

| Column  | Type   | Options     |
| name	  | string | index: true |

## Association

has_many :products