class HomeController < ApplicationController
  def index
    @warehouses = Warehouse.all
    @providers = Provider.all
  end
end