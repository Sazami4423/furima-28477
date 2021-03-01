# README

## usersテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| nickname         | string     | null: false |
| email            | string     | null: false |
| password         | string     | null: false |
| surname          | string     | null: false |
| name             | string     | null: false |
| surname_kana     | string     | null: false |
| name_kana        | string     | null: false |
| birthday         | integer    | null: false |

## productsテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| title            | string     | null: false |
| description_text | text       | null: false |
| category         | string     | null: false |
| product_status   | string     | null: false |
| shipping_fee     | string     | null: false |
| shipment_source  | string     | null: false |
| days             | string     | null: false |
| price            | integer    | null: false |
| user_id          | references | null: false |

## ordersテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| prefectures      | string     | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building_name    | string     | ----------- |
| tel              | integer    | null: false |
| user_id          | references | ----------- |
| products_id      | references | ----------- |