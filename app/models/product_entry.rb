class ProductEntry
  attr_reader :quantity, :product_model_id, :warehouse_id
  def initialize(quantity:, product_model_id:, warehouse_id:)
    @quantity = quantity.to_i
    @product_model_id = product_model_id
    @warehouse_id = warehouse_id
  end

  def process
    warehouse = Warehouse.find(warehouse_id)
    product_model = ProductModel.find(product_model_id)

    warehouse.warehouse_categories.each do |w|
      if w.category.name == product_model.category.name
        ProductItem.transaction do
          quantity.times do
            ProductItem.create!(warehouse: warehouse, product_model: product_model)
          end
        end
      end
    end
  end

  def remove
    warehouse = Warehouse.find(warehouse_id)
    product_model = ProductModel.find(product_model_id)
    product_item = ProductItem.where(warehouse: warehouse, product_model: product_model)
    
    product_item.limit(quantity).each do |pi|
      ProductItem.transaction do
        quantity.times do
          pi.destroy
        end
      end
    end
  end
end