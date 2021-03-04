class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :title,              null: false
      t.text       :description_text,   null: false
      t.integer    :category_id,        null: false
      t.integer    :product_status_id,  null: false
      t.integer    :shipping_fee_id,    null: false
      t.integer    :prefectures_id,     null: false
      t.integer    :days_id,            null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
