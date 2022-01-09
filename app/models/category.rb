class Category < ApplicationRecord
  validates :name, presence: true
  has_many :product_models
  has_many :warehouse_categories
  has_many :warehouse, through: :warehouse_categories
end
