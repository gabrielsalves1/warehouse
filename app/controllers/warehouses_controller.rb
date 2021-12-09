class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :address, :state, :city, :postal_code, 
                                      :description, :useful_area, :total_area)
    warehouse = Warehouse.new(warehouse_params)
    warehouse.save()
    #flash[:notice] = 'Galpão registrado com sucesso'
    redirect_to warehouse_path(warehouse.id), notice: 'Galpão registrado com sucesso'
  end
end