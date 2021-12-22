class ProductModel < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  has_many :product_bundle_items
  validates :name, :weight, :height, :width, :length, :sku, presence: true
  validates :sku, length: { is: 20, message: 'SKU deve conter 20 caracteres' }, uniqueness: true
  
  def dimensions()
    "#{height} x #{width} x #{length}"
  end
end
