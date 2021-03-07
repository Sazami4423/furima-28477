class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,             null: false
      t.text       :text,              null: false
      t.integer    :category_id,       null: false
      t.integer    :product_status_id, null: false
      t.integer    :shipping_fee_id,   null: false
      t.integer    :prefectures_id,    null: false
      t.integer    :days_id,           null: false
      t.timestamps
    end
  end
end
