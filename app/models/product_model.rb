class ProductModel < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  has_many :product_bundle_items
  validates :name, :weight, :height, :width, :length, presence: true
  validates :weight, :height, :width, :length, numericality: { greater_than: 0 }
  validates :sku, uniqueness: true
  
  def dimensions()
    "#{height} x #{width} x #{length}"
  end

  before_save do
    self.sku = SecureRandom.hex(20)
  end
    
end
