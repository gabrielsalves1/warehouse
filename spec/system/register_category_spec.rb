require 'rails_helper'

describe 'Cadastra categoria' do
  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar categoria'
    fill_in 'Nome', with: 'Geek'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content 'Categoria: Geek'
  end
end