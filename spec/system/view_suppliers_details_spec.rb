require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do
  it 'com sucesso' do
    # Arrange
    Supplier.create(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
                    cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cerâmicas Geek'

    # Assert
    expect(page).to have_content 'Cerâmicas Geek'
    expect(page).to have_content 'Cerâmicas'
  end

  it 'e vê os produtos do fornecedor' do
    # Arrange
    s = Supplier.create!(fantasy_name: 'Presentes Geek', legal_name: 'Geek Comércio de Presentes LTDA',
                        cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    ProductModel.create!(name: 'Caneca Star Wars', height: '14', width: '10', length: '8', 
                        weight: 300, sku: 'CANSW12032103', supplier: s)
    ProductModel.create!(name: 'Pelúcia Dumbo', height: '50', width: '40', length: '20',
                        weight: 400, sku: 'PLD0291302194', supplier: s)

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Presentes Geek'

    # Assert
      expect(page).to have_css('h1', text: 'Presentes Geek')
      expect(page).to have_css('h2', text: 'Produtos deste fornecedor:')
      expect(page).to have_content('Caneca Star Wars')
      expect(page).to have_content('CANSW12032103')
      expect(page).to have_content('Pelúcia Dumbo')
      expect(page).to have_content('PLD0291302194')
  end
end