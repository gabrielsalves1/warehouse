require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  context 'cep inválido não pode ser registrado' do
    it 'cep com formato inválido' do
      #Arrange
      warehouse = Warehouse.create(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                                  state: 'SP', postal_code: '755', total_area: '3000', useful_area: '2000')

      #Act
      result = warehouse.valid?

      #Assert
      expect(result).to eq false
    end

    it 'código duplicado' do
      #Arrange
      warehouse = Warehouse.create(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                                  state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
      warehouse2 = Warehouse.new(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                                  state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
      #Act
      result = warehouse2.valid?
  
      #Assert
      expect(result).to eq false
    end
  end
end
