require 'rails_helper'

describe 'Visitante vê as categorias' do
  it 'a partir da tela inicial o link para Categorias' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_link('Categorias')
  end

  it 'e vê todos dados cadastrados' do
    # Arrange
    Category.create!(name: 'Móveis')

    # Act
    visit categories_path
    click_on 'Móveis'

    # Assert
    expect(page).to have_content('Categoria: Móveis')
  end

  it 'e não existem categorias' do
    # Arrange

    # Act
    visit root_path
    click_on 'Categorias'

    # Assert
    expect(page).to have_content('Nenhuma categoria cadastrada')
  end
end