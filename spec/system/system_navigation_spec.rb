require 'rails_helper'

describe 'Visitante navega' do
  it 'usando o menu' do
    visit root_path

    # Assert 1
    expect(page).to have_css('nav a', text: 'Início')

    # Assert 2
    within('nav') do
      expect(page).to have_link('Início', href: root_path)
    end
  end

  it 'e não vê opções no menu sem estar logado' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).not_to have_link('Cadastrar novo galpão')
    expect(page).not_to have_link('Cadastrar novo fornecedor')
    expect(page).not_to have_link('Criar novo kit de produtos')
    expect(page).not_to have_link('Cadastrar modelo de produto')
  end
end