class ProvidersController < ApplicationController
  def show
    @provider = Provider.find(params[:id])
  end

  def new
    @provider = Provider.new
  end

  def create
    provider_params = params.require(:provider).permit(:fantasy_name, :corporate_name, :cnpj, :email, :product, :telephone)
    @provider = Provider.new(provider_params)

    if @provider.save()
      redirect_to provider_path(@provider.id), notice: 'Fornecedor registrado com sucesso'
    else
      flash[:alert] = 'Não foi possível gravar o fornecedor'
      render 'new'
    end
  end
end