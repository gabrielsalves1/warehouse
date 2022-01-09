require 'rails_helper'

describe 'Cadastra categoria' do
  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')
    Warehouse.create(name: 'Guarulhos 2', code: 'GRU 2', description: 'Ótimo galpão numa linda cidade',
      address: 'Praça 9', city: 'Guarulhos', state: 'SP',
      postal_code: '09900-000', total_area: 10000, useful_area: 8000)

    # Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar categoria'
    fill_in 'Nome', with: 'Geek'
    check 'Guarulhos 2'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Categoria: Geek'
    expect(page).to have_content 'Guarulhos 2'
  end
end