require 'rails_helper'

describe 'Usuário registra um kit' do
  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')
    supplier = Supplier.create!(fantasy_name: 'Vinícola Miolo', legal_name: 'Miolo Fábrica de Bebidas LTDA',
      cnpj: '51905325000154', email: 'contato@miolos.com', product: 'Fornecedor de Bebidas', telephone: '(11) 94102-0000')
    category = Category.create!(name: 'Vinho')
    ProductModel.create!(name: 'Vinho Tinto Miolo', height: '30', width: '10', length: '10',
                        weight: 800, supplier: supplier, category: category)
    ProductModel.create!(name: 'Taça para Vinho', height: '12', width: '10', length: '10',
                        weight: 50, supplier: supplier, category: category)
    ProductModel.create!(name: 'Vinho Branco Miolo', height: '30', width: '10', length: '10',
                        weight: 800, supplier: supplier, category: category)

    # Act
    login_as(user)
    visit root_path
    click_on 'Criar novo kit de produtos'
    fill_in 'Nome', with: 'Kit Degustação Miolo'
    check 'Vinho Tinto Miolo'
    check 'Vinho Branco Miolo'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Kit Degustação Miolo'
    expect(page).to have_content 'Vinho Branco Miolo'
    expect(page).to have_content 'Vinho Tinto Miolo'
  end
end