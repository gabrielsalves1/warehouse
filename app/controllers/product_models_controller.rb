class ProductModelsController < ApplicationController
  def show
    @product_model = ProductModel.find(params[:id])
  end
  
  def new
  end
  
  def create
    procut_model_params = params.require(:product_model).permit(:name, :sku, :weight, :width, :length, :height, :supplier_id)
    product_model = ProductModel.new(procut_model_params)

    if product_model.save()
      redirect_to product_model, notice: 'Modelo de produto registrado com sucesso'
    end
  end
end