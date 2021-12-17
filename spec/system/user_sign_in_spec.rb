require 'rails_helper'

describe 'Usuário faz login' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'joao@email.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Criar Usuário'

    # Assert
    expect(current_path).to eq root_path
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_link 'Sair'
    expect(page).to have_content 'Olá, joao@email.com'
    expect(page).to have_content 'Login efetuado com sucesso'
  end

  it 'e faz logout com sucesso' do
      # Arrange
      User.create!(email: 'joao@email.com', password: '12345678')
  
      # Act
      visit root_path
      click_on 'Entrar'
      fill_in 'E-mail', with: 'joao@email.com'
      fill_in 'Senha', with: '12345678'
      click_on 'Criar Usuário'
      click_on 'Sair'
  
      # Assert
      expect(current_path).to eq root_path
      expect(page).not_to have_link 'Sair'
      expect(page).to have_link 'Entrar'
      expect(page).not_to have_content 'Olá, joao@email.com'
  end
end
