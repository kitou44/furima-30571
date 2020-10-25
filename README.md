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


##  destinationテーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
|user_id	        | string	  |null: false, foreign_key: true |
|post_code_id	    | string	  |null: false                    |
|prefecture	      | integer	  |null: false                    |
|city	            | string	  |null: false                    |
|address	        | string	  |null: false                    |
|building_name	  | integer	  |                               |
|phone_number	    | string    |null: false                    |

### Association

belongs_to :destination


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
| judgment	    | string	|                                |
| category_id	  | integer	| null: false, foreign_key: true |
| user_id	      | integer	| null: false, foreign_key: true |

## Association

belongs_to_active_hash :prefecture

