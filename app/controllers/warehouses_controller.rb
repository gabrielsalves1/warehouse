class WarehousesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :address, :state, :city, :postal_code, 
                                      :description, :useful_area, :total_area, category_ids: [])
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save()
      redirect_to warehouse_path(@warehouse.id), notice: 'Galpão registrado com sucesso'
    else
      flash[:alert] = 'Não foi possível gravar o galpão'
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])

    if @warehouse.update(params.require(:warehouse).permit(:name, :code, :address, :state, :city, :postal_code, 
      :description, :useful_area, :total_area))
      return redirect_to(warehouse_path(@warehouse.id))
    end

    render :edit
  end
end