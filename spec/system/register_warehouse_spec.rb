require 'rails_helper'

describe 'Usuário cadastra um galpão' do
  it 'visitante não acessa diretamente o formulário' do
    # Arrange

    # Act
    visit new_warehouse_path

    # Assert
    expect(current_path).to eq new_user_session_path 
  end

  it 'através de um link na tela inicial e contém os campos' do
    # Arrange
    User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    visit root_path
    click_on 'Entrar'
    within('form#new_user') do
      fill_in 'E-mail', with: 'joao@email.com'
      fill_in 'Senha', with: '12345678'
      click_on 'Criar Usuário'
    end
    click_on 'Cadastrar novo galpão'

    # Assert
    expect(page).to have_content 'Novo Galpão'
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Código'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
    expect(page).to have_field 'CEP'
    expect(page).to have_field 'Descrição'
    expect(page).to have_field 'Área Total'
    expect(page).to have_field 'Área Útil'
  end

  it 'com sucesso' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar novo galpão'
    fill_in 'Nome', with: 'Juiz de Fora'
    fill_in 'Código', with: 'JDF'
    fill_in 'Endereço', with: 'Av Rio Branco'
    fill_in 'Cidade', with: 'Juiz de Fora'
    fill_in 'Estado', with: 'MG'
    fill_in 'CEP', with: '36000-000'
    fill_in 'Descrição', with: 'Um galpão mineiro com o pé no Rio'
    fill_in 'Área Total', with: '5000'
    fill_in 'Área Útil', with: '3000'
    click_on 'Gravar'

    # Assert
    expect(page).to have_content('Juiz de Fora')
    expect(page).to have_content('JDF')
    expect(page).to have_content('Galpão registrado com sucesso')
    expect(page).to have_content('Av Rio Branco')
    expect(page).to have_content('Juiz de Fora/MG')
    expect(page).to have_content('CEP: 36000-000')
    expect(page).to have_content('Um galpão mineiro com o pé no Rio')
    expect(page).to have_content('Área Total: 5000 m2')
    expect(page).to have_content('Área Útil: 3000 m2')
  end

  it 'e todos campos são obrigatórios' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')

    # Act
    login_as(user)
    visit root_path
    click_on 'Cadastrar novo galpão'
    fill_in 'Nome', with: ''
    fill_in 'Código', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Gravar'

    # Assert
    expect(page).to_not have_content 'Galpão registrado com sucesso'
    expect(page).to have_content 'Não foi possível gravar o galpão'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Código não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
  end

  it 'e edita os campos preenchidos' do
    # Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')
    Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
      postal_code: '57050-000', total_area: 10000, useful_area: 8000)

    # Act
    login_as(user)
    visit root_path
    click_on 'Maceió'
    click_on 'Editar' 
    fill_in 'Endereço', with: 'Rua Pascoal Leite'
    click_on 'Gravar'

    #Assert
    expect(page).to have_content 'Rua Pascoal Leite'
  end
end