class RemoveQuantityFromProductModelItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :product_model_items, :quantity, :string
  end
end
