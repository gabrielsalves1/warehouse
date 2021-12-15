require 'rails_helper'

RSpec.describe Supplier, type: :model do
  context 'CNPJ inválido não pode ser registrado' do
    it 'e não cadastra CNPJ com formato inválido' do
      # Arrange
      supplier = Supplier.create(fantasy_name: 'Fornecedora Bom Jesus', legal_name: 'Fornecedora Bom Jesus', 
                                cnpj: '076999390001351234', email: 'fornecbomjesus@gmail.com', product: 'Fornecedor de Bebidas',
                                telephone: '(11) 00000-0000')
      
      # Act
      result = supplier.valid?
      
      # Assert
      expect(result).to eq false
    end
  
    it 'e não cadastra CNPJ duplicado' do
      # Arrange
      supplier = Supplier.create(fantasy_name: 'Fornecedora Bom Jesus', legal_name: 'Fornecedora Bom Jesus', cnpj: '07699939000135',
                                email: 'fornecbomjesus@gmail.com', product: 'Fornecedor de Bebidas', telephone: '(11) 00000-0000')
      
      supplier2 = Supplier.new(fantasy_name: 'Fornecedora Bom Jesus 2', legal_name: 'Fornecedora Bom Jesus', cnpj: '07699939000135',
                              email: 'fornecbomjesus@gmail.com', product: 'Fornecedor de Bebidas', telephone: '(11) 00000-0000')
      
      # Act
      result = supplier2.valid?
      
      # Assert
      expect(result).to eq false
    end
  end
end
