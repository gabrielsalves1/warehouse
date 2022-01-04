class ProductModel < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  has_many :product_bundle_items
  has_many :product_model_items
  validates :name, :weight, :height, :width, :length, presence: true
  validates :weight, :height, :width, :length, numericality: { greater_than: 0 }
  validates :sku, uniqueness: true
  
  before_save :generate_sku

  def dimensions
    "#{height} x #{width} x #{length}"
  end

  private
  def generate_sku
    self.sku = SecureRandom.hex(20)
  end
    
end
