class Provider < ApplicationRecord
  validates :fantasy_name, :corporate_name, :cnpj, :email, :product, :telephone, presence: true
end
