require 'rails_helper'

describe 'Visitante vê um fornecedor' do
  it 'a partir da tela inicial o link para Fornecedores' do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(page).to have_link('Fornecedores')
  end

  it 'e vê todos dados cadastrados' do
    #Arrange -> preparar o banco
    Provider.create(fantasy_name: 'Fornecedor X', corporate_name: 'Fornecedor X', cnpj: '00000000000000',
                    email: 'emailfake@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')

    #Act
    visit providers_path
    click_on 'Fornecedor X'

    #Assert
    expect(page).to have_content('0000000000000')
    expect(page).to have_content('emailfake@gmail.com')
    expect(page).to have_content('Fornecedor de materiais diversos')
  end

  it 'e consegue voltar para a tela inicial' do
    # Arrange
    Provider.create(fantasy_name: 'Fornecedor X', corporate_name: 'Fornecedor X',
      cnpj: '00000000000000', email: 'emailfake@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')

    # Act
    visit providers_path
    click_on 'Fornecedor X'
    click_on 'Voltar'

    # Assert
    expect(current_path).to eq root_path
  end

  it 'e não existem fornecedores' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'

    #Assert
    expect(page).to have_content('Nenhum fornecedor cadastrado')
  end
end