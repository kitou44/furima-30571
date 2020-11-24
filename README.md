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

has_many :items dependent :destroy
has_many :order dependent :destroy

##  destinationテーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
|order          	| references|null: false, foreign_key: true |
|prefecture_id    | integer	  |null: false                    |
|city	            | string	  |null: false                    |
|post_code        | string    |null: false                    |
|address	        | string	  |null: false                    |
|building_name	  | string	  |                               |
|phone_number	    | string    |null: false                    |

### Association

belongs_to :order


## Itemテーブル

| Column            |	Type      |	Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| description       | text   	  | null: false                    |
| category_id	      | integer	  | null: false                    |
| user_id	          | integer	  | null: false, foreign_key: true |
| condition_id      | integer	  | null: false                    |
| price   	        | integer	  | null: false                    |
| trading_status_id | integer	  | null: false                    |
| prefecture_id     | integer   | null: false                    |
| shopping_cost_id  | integer   | null: false                    |

## Association

belongs_to_active_hash :prefecture
belongs_to :user
has_one : order

## Order

| Column        |	Type        |	Options                        |
| ------------- | ----------- | -----------------------------  |
| user          | references	| null: false,foreign_key: true  |
| item          | references	| null: false,foreign_key: true  |

## Association

belongs_to :user
belongs_to :item
has_one :destination