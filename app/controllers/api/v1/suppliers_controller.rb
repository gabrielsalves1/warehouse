class Api::V1::SuppliersController <  Api::V1::ApiController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json(except: [:created_at, :updated_at]), status: 200
  end

  def show
    supplier = Supplier.find(params[:id])
    render json: supplier.as_json(except: [:created_at, :updated_at]), status: 200
  end

  def create
    supplier = Supplier.new(fantasy_name: params[:fantasy_name], legal_name: params[:legal_name],
      cnpj: params[:cnpj], email: params[:email], product: params[:product], telephone: params[:telephone])

    if supplier.save()
      render json: supplier, status: 201
    else
      render status: 422, json: supplier.errors.full_messages
    end
  end
end