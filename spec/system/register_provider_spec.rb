require 'rails_helper'

describe 'Visitante registra um fornecedor' do
  it 'através de um link na tela inicial' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar novo fornecedor'

    #Assert
    expect(page).to have_content 'Novo Fornecedor'
    expect(page).to have_field 'Nome Fantasia'
    expect(page).to have_field 'Razão Social'
    expect(page).to have_field 'CNPJ'
    expect(page).to have_field 'E-mail'
    expect(page).to have_field 'Produto'
    expect(page).to have_field 'Telefone'
  end

  it 'com sucesso' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: 'Fornecedora Bom Jesus'
    fill_in 'Razão Social', with: 'Fornecedora Bom Jesus'
    fill_in 'CNPJ', with: '07699939000135'
    fill_in 'E-mail', with: 'fornecbomjesus@gmail.com'
    fill_in 'Produto', with: 'Fornecedor de Bebidas'
    fill_in 'Telefone', with: '(11) 00000-0000'
    click_on 'Gravar'

    #Assert
    expect(page).to have_css('h1', text: 'Fornecedora Bom Jesus')
    expect(page).to have_content('07699939000135')
    expect(page).to have_content('fornecbomjesus@gmail.com')
    expect(page).to have_content('Fornecedor de Bebidas')
    expect(page).to have_content('(11) 00000-0000')
  end

  it 'e todos campos são obrigatórios' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    click_on 'Gravar'

    #Assert
    expect(page).to have_content 'Não foi possível gravar o fornecedor'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
  end

  it 'e não cadastra pois o CNPJ é inválido' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: 'Fornecedora Bom Jesus'
    fill_in 'Razão Social', with: 'Fornecedora Bom Jesus'
    fill_in 'CNPJ', with: '076999390001351234'
    fill_in 'E-mail', with: 'fornecbomjesus@gmail.com'
    fill_in 'Produto', with: 'Fornecedor de Bebidas'
    fill_in 'Telefone', with: '(11) 00000-0000'
    click_on 'Gravar'

    #Assert
    expect(page).to have_content('Preencha somente os 14 números do CNPJ')
  end

  it 'e não cadastra CNPJ duplicado' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: 'Fornecedora Bom Jesus'
    fill_in 'Razão Social', with: 'Fornecedora Bom Jesus'
    fill_in 'CNPJ', with: '07699939000135'
    fill_in 'E-mail', with: 'fornecbomjesus@gmail.com'
    fill_in 'Produto', with: 'Fornecedor de Bebidas'
    fill_in 'Telefone', with: '(11) 00000-0000'
    click_on 'Gravar'

    visit root_path
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Nome Fantasia', with: 'Fornecedora Bom Jesus'
    fill_in 'Razão Social', with: 'Fornecedora Bom Jesus'
    fill_in 'CNPJ', with: '07699939000135'
    fill_in 'E-mail', with: 'fornecbomjesus@gmail.com'
    fill_in 'Produto', with: 'Fornecedor de Bebidas'
    fill_in 'Telefone', with: '(11) 00000-0000'
    click_on 'Gravar'

    #Assert
    expect(page).to have_content('CNPJ duplicado')
  end
end