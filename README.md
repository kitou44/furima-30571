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

has_many :products dependent :destroy

##  destinationテーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
|user_id	        | integer	  |null: false, foreign_key: true |
|prefecture_id    | integer	  |null: false                    |
|city	            | string	  |null: false                    |
|address	        | string	  |null: false                    |
|building_name	  | string	  |                               |
|phone_number	    | string    |null: false                    |

### Association

belongs_to :user_id


## productテーブル

| Column        |	Type     |	Options                       |
| ------------- | -------- | -----------------------------  |
| name          | string   | null: false                    |
| price	        | integer	 | null: false                    |
| description	  | integer	 | null: false                    |
| status	      | integer	 |                                |
| size	        | integer	 |                                |
| judgment	    | string	 |                                |
| category_id	  | integer	 | null: false, foreign_key: true |
| user_id	      | integer	 | null: false, foreign_key: true |
| condition	    | integer	 | null: false                    |
| price	        | integer	 | null: false                    |
| trading_status|	integer	 | null: false                    |
| completed_at	| datetime |                                |	

## Association

belongs_to_active_hash :prefecture
belongs_to :user dependent: :destroy

## Order history

| Column        |	Type    |	Options                        |
| ------------- | ------- | -----------------------------  |
| user_id       | integer	| null: false, foreign_key: true |
| item_id       | string	| null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :item
