require 'rails_helper'

describe 'Usuário faz logout' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'
    click_on 'Sair'

    # Assert
    expect(current_path).to eq root_path
    expect(page).not_to have_link 'Sair'
    expect(page).to have_link 'Entrar'
  end
end