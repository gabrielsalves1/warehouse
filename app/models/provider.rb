class Provider < ApplicationRecord
  validates :fantasy_name, :corporate_name, :email, :product, presence: true

  validates :cnpj, length: { is: 14, message: 'Preencha somente os 14 números do CNPJ' }, uniqueness: { message: 'CNPJ duplicado' }, presence: true
end
