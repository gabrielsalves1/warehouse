require 'rails_helper'

RSpec.describe ProductItem, type: :model do
  it 'deve gerar um código aleatório' do
    #Arrange
    warehouse = Warehouse.create(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
      state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
    supplier = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
      cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    category = Category.create!(name: 'Geek')
    product_model = ProductModel.create!(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: supplier, category: category)
    p = ProductItem.new(warehouse: warehouse, product_model: product_model)
    allow(SecureRandom).to receive(:hex).with(10).and_return 'P4L19Kp2Mz'
  
    #Act
    p.save()

    #Assert
    expect(p.code).to eq 'P4L19Kp2Mz'
  end

  it 'SKU deve ser único' do
    #Arrange
    warehouse = Warehouse.create(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
      state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
    supplier = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
      cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    category = Category.create!(name: 'Geek')
    product_model = ProductModel.create(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: supplier, category: category)
    p1 = ProductItem.create!(warehouse: warehouse, product_model: product_model)
    p2 = ProductItem.new(warehouse: warehouse, product_model: product_model)
    allow(SecureRandom).to receive(:hex).with(10).and_return 'P4L19Kp2Mz'
  
    #Act
    p2.save()

    #Assert
    expect(p1.code).not_to eq 'P4L19Kp2Mz'
    expect(p2.code).to eq 'P4L19Kp2Mz'
  end
end
