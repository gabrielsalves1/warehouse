class ProductModelItem < ApplicationRecord
  belongs_to :warehouse
  belongs_to :product_model
end
