class ProductModelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def show
    @product_model = ProductModel.find(params[:id])
  end
  
  def new
    @product_model = ProductModel.new
  end
  
  def create
    product_model_params = params.require(:product_model).permit(:name, :weight, :width, :length, :height, :supplier_id, :category_id)
    product_model = ProductModel.new(product_model_params)

    if product_model.save()
      redirect_to product_model, notice: 'Modelo de produto registrado com sucesso'
    end
  end

  def edit
    @product_model = ProductModel.find(params[:id])
  end

  def update
    @product_model = ProductModel.find(params[:id])

    if @product_model.update(params.require(:product_model).permit(:name, :sku, :weight, :width, :length, :height, :supplier_id, :category_id))
      return redirect_to(product_model_path(@product_model.id))
    end
    
    render :edit
  end
end