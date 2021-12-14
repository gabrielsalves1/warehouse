require 'rails_helper'

describe 'Usuário cadastra um model do produto' do
  it 'com sucesso' do
    # Arrange
    Supplier.create(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
                    cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    
    # Act
    visit root_path
    click_on 'Cadastrar modelo de produto'
    fill_in 'Nome', with: 'Caneca Star Wars'
    fill_in 'Peso', with: 300
    fill_in 'Altura', with: '12'
    fill_in 'Largura', with: '8'
    fill_in 'Profundidade', with: '14'
    fill_in 'Código SKU', with: 'CN203040ABC'
    save_page
    select 'Cerâmicas Geek', from: 'Fornecedor'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Modelo de produto registrado com sucesso'
    expect(page).to have_content 'Caneca Star Wars'
    expect(page).to have_content '300 gramas'
    expect(page).to have_content 'Dimensões: 12 x 8 x 14'
    expect(page).to have_content 'SKU: CN203040ABC'
    expect(page).to have_content 'Cerâmicas Geek'
  end
end