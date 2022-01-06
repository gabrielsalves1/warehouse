class HomeController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def search
    @warehouses = Warehouse.where('name like ?',
      "%#{params[:q]}%")
  end
end