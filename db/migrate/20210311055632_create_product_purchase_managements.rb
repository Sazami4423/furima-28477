class CreateProductPurchaseManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_managements do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
