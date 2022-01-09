class Warehouse < ApplicationRecord
  validates :name, :code, :description, :address, :city, :state, :postal_code, :total_area, :useful_area, presence: true
  validates :code, uniqueness: true
  validates :postal_code, format: { with: /\d{5}-\d{3}/ }
  has_many :product_items
  has_many :warehouse_categories
  has_many :category, through: :warehouse_categories
end
