# README

## usersテーブル

| Colum              | Type       | Options                |
| ------------------ | ---------- | ---------------------  |
| nickname           | string     | null: false uniqueness |
| email              | string     | null: false            |
| encrypted_password | string     | null: false            |
| surname            | string     | null: false            |
| name               | string     | null: false            |
| surname_kana       | string     | null: false            |
| name_kana          | string     | null: false            |
| birthday           | integer    | null: false            |

### Association

- has_many :products
- has_many :orders


## productsテーブル

| Colum               | Type       | Options     |
| ------------------- | ---------- | ----------- |
| title               | string     | null: false |
| description_text    | text       | null: false |
| category_id         | integer    | null: false |
| product_status_id   | integer    | null: false |
| shipping_fee_id     | integer    | null: false |
| shipment_source_id  | integer    | null: false |
| days_id             | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false |

### Association

- has_one   :order
- belongs_to :user


## ordersテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| prefectures      | string     | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building_name    | string     | ----------- |
| tel              | integer    | null: false |

 ### Association

- belongs_to :product
- belongs_to :user
  has_one    :product_purchase_management

 ## product_purchase_managementsテーブル

 | Colum            | Type       | Options     |
 | ---------------- | ---------- | ----------- |
 | user             | references | null: false |
 | products         | references | null: false |

 ### Association

- belongs_to :order
- 