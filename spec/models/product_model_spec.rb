require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  it '.dimension' do
    # Arrange
    p = ProductModel.new(height: '14', width: '10', length: '12')
    
    # Act
    result = p.dimensions()
    
    # Assert
    expect(result).to eq '14 x 10 x 12'  
  end

  it 'deve gerar um SKU aleatório' do
    #Arrange
    s = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
      cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    c = Category.create!(name: 'Geek')
    p = ProductModel.new(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: s, category: c)
    allow(SecureRandom).to receive(:hex).with(20).and_return 'P4L19Kp2Mz3LSNr1xgW4'
  
    #Act
    p.save()

    #Assert
    expect(p.sku).to eq 'P4L19Kp2Mz3LSNr1xgW4'
  end

  it 'SKU deve ser único' do
    #Arrange
    s = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
      cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    c = Category.create!(name: 'Geek')
    p1 = ProductModel.create!(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: s, category: c)
    p2 = ProductModel.create!(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: s, category: c)
    allow(SecureRandom).to receive(:hex).with(20).and_return 'P4L19Kp2Mz3LSNr1xgW4'
  
    #Act
    p1.save()

    #Assert
    expect(p1.sku).to eq 'P4L19Kp2Mz3LSNr1xgW4'
    expect(p2.sku).not_to eq 'P4L19Kp2Mz3LSNr1xgW4'
  end
end
