require 'rails_helper'

describe 'Usuário cadastra um model do produto' do
  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')
    Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
                    cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    Category.create!(name: 'Geek')
    
    # Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar modelo de produto'
    fill_in 'Nome', with: 'Caneca Star Wars'
    fill_in 'Peso', with: 300
    fill_in 'Altura', with: '12'
    fill_in 'Largura', with: '8'
    fill_in 'Profundidade', with: '14'
    fill_in 'Código SKU', with: 'CAN54345226542823801'
    select 'Cerâmicas Geek', from: 'Fornecedor'
    select 'Geek', from: 'Categoria'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Modelo de produto registrado com sucesso'
    expect(page).to have_content 'Caneca Star Wars'
    expect(page).to have_content '300 gramas'
    expect(page).to have_content 'Dimensões: 12 x 8 x 14'
    expect(page).to have_content 'SKU: CAN5434522654282380'
    expect(page).to have_content 'Cerâmicas Geek'
    expect(page).to have_content 'Geek'
  end

  it 'e consegue editar com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')
    s = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
                    cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
    c = Category.create!(name: 'Geek')
    ProductModel.create!(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', sku: 'LEG54345226542823801', supplier: s, category: c)
    
    # Act
    login_as(user)
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cerâmicas Geek'
    click_on 'Lego'
    click_on 'Editar'
    fill_in 'Nome', with: 'Lego Marvel'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Lego Marvel'
  end
end