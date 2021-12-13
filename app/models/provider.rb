class Provider < ApplicationRecord
  validates :fantasy_name, :corporate_name, :cnpj, :email, :product, presence: true

  validates :cnpj, length: { is: 14, message: 'Preencha somente os 14 números do CNPJ' }, uniqueness: { message: 'CNPJ duplicado' }
end
