class CreateProductModelItems < ActiveRecord::Migration[6.1]
  def change
    create_table :product_model_items do |t|
      t.string :code
      t.references :warehouse, null: false, foreign_key: true
      t.references :product_model, null: false, foreign_key: true
      t.string :quantity

      t.timestamps
    end
  end
end
