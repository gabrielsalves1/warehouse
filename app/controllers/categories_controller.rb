class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @category = Category.all
  end

  def new
    @category = Category.new 
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    category_params = params.require(:category).permit(:name)
    @category = Category.new(category_params)
    if @category.save
      return redirect_to @category
    end
    render :new
  end
end