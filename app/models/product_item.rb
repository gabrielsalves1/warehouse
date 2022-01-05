class ProductItem < ApplicationRecord
  belongs_to :warehouse
  belongs_to :product_model
  validates :code, uniqueness: true
  
  before_save :generate_code

  private
  def generate_code
    self.code = SecureRandom.hex(10)
  end
end
