require 'rails_helper'

describe 'Usuário faz login' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'joao@email.com', password: '12345678')
    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_link 'Sair'
    expect(page).not_to have_link 'Entrar'
    expect(page).not_to have_content 'Olá joao@email.com'
  end
end