class Api::V1::WarehousesController <  Api::V1::ApiController
  def index
    warehouses = Warehouse.all
    render json: warehouses.as_json(except: [:address, :created_at, :updated_at]), status: 200
  end

  def show
    begin
      warehouse = Warehouse.find(params[:id])
      render json: warehouse.as_json(except: [:created_at, :updated_at]), status: 200
    rescue ActiveRecord::RecordNotFound
      render json: '{}', status: 404
    end
  end

  def create
    warehouse = Warehouse.new(name: params[:name], code: params[:code], address: params[:address], state: params[:address],
      city: params[:city], postal_code: params[:postal_code], description: params[:description], useful_area: params[:useful_area],
      total_area: params[:total_area], category_ids: params[:category_ids])

    if warehouse.save()
      render json: warehouse, status: 201
    else
      render status: 422, json: warehouse.errors.full_messages
    end
  end
end