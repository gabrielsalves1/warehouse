class ProductModelItemsController < ApplicationController

  def new
  end

  def create_item
    @product_model_items = ProductModelItems.new
  end
end