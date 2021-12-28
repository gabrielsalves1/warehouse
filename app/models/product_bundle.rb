class ProductBundle < ApplicationRecord
  has_many :product_bundle_items
  has_many :product_models, through: :product_bundle_items
  validates :name, presence: true
  validates :sku, uniqueness: true

  before_save do
    self.sku = 'K'+SecureRandom.hex(20).upcase
  end
end
