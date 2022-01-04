class ProductItemsEntryController < ActionController::Base
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end
end
