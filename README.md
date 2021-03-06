# README

## usersテーブル

| Colum              | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false unique: true |
| encrypted_password | string     | null: false              |
| surname            | string     | null: false              |
| name               | string     | null: false              |
| surname_kana       | string     | null: false              |
| name_kana          | string     | null: false              |
| birthday           | date       | null: false              |

### Association

  has_many :products
  has_many :product_purchase_managements


## productsテーブル

| Colum               | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| title               | string     | null: false                   |
| description_text    | text       | null: false                   |
| category_id         | integer    | null: false                   |
| product_status_id   | integer    | null: false                   |
| shipping_fee_id     | integer    | null: false                   |
| prefectures_id      | integer    | null: false                   |
| days_id             | integer    | null: false                   |
| price               | integer    | null: false                   |
| user                | references | null: false foreign_key: true |

### Association

  belongs_to :user
  has_one_attached :image
  has_one :product_purchase_management


## Addressテーブル

| Colum                       | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| postal_code                 | string     | null: false                   |
| prefectures_id              | integer    | null: false                   |
| municipalities              | string     | null: false                   |
| address                     | string     | null: false                   |
| building_name               | string     | ----------------------------- |
| tel                         | string     | null: false                   |
| product_purchase_management | references | null: false foreign_key: true |

 ### Association

  belongs_to :product_purchase_management

 ## product_purchase_managementsテーブル

 | Colum            | Type       | Options                       |
 | ---------------- | ---------- | ----------------------------- |
 | user             | references | null: false foreign_key: true |
 | product          | references | null: false foreign_key: true |

 ### Association
  
  has_one    :order
  belongs_to :user
  belongs_to :product
  
  