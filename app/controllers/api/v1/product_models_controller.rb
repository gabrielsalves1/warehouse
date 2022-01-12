class Api::V1::ProductModelsController <  Api::V1::ApiController
  def index
    product_models = ProductModel.all
    render json: product_models.as_json(except: [:created_at, :updated_at], methods: [:dimensions]), status: 200
  end

  def show
    product_models = ProductModel.find(params[:id])
    render json: product_models.as_json(except: [:created_at, :updated_at],
                                        methods: [:dimensions],
                                        include: {supplier: {except: [:created_at, :updated_at]}}), status: 200
  end

  def create
    product_model = ProductModel.new(name: 'Caneca', weight: '10', height: '10', length: '5', width: '5',
                                    supplier_id: params[:supplier_id], category_id: params[:category_id])

    if product_model.save()
      render json: product_model, status: 201
    else
      render status: 422, json: product_model.errors.full_messages
    end
  end
end