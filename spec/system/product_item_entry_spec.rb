require 'rails_helper'

describe 'Usuário dá entrada em novos itens' do
  it 'com sucesso' do
    # Arrange
    user = User.create(email: 'admin@email.com', password: '12345678')
    warehouse = Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
      postal_code: '57050-000', total_area: 10000, useful_area: 8000)
    supplier = Supplier.create(fantasy_name: 'Fornecedor X', legal_name: 'Fornecedor X', cnpj: '00000000000000',
      email: 'emailfake@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')
    category = Category.create!(name: 'Presentes')
    p1 = ProductModel.create!(name: 'Pelúcia Dumbo', height: '50', width: '40', length: '20',
      weight: 400, supplier: supplier, category: category)
    p2 = ProductModel.create!(name: 'Caneca Star Wars', height: '14', width: '10', length: '8',
            weight: 300, supplier: supplier, category: category)

    # Act
    login_as(user)
    visit root_path
    click_on 'Entrada de Itens'
    fill_in 'Quantidade', with: 100
    select 'MCZ', from: 'Galpão Destino'
    select 'Pelúcia Dumbo', from: 'Produto'
    # Preço
    # Número do Lote
    click_on 'Confirmar'

    # Assert
    expect(current_path).to eq warehouse_path(warehouse.id)
    expect(page).to have_css('h2', text: 'Estoque')
    within("div#product-#{p1.id}") do
      expect(page).to have_content('Pelúcia Dumbo')
      expect(page).to have_content('Quantidade: 100')
    end
  end
end