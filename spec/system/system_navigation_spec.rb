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

  it 'e pesquisa por um galpão' do
    warehouse = Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
      postal_code: '57050-000', total_area: 10000, useful_area: 8000)
    warehouse = Warehouse.create(name: 'Guarulhos', code: 'GRU', description: 'Ótimo galpão numa linda cidade',
      address: 'Praça 7', city: 'Guarulhos', state: 'SP',
      postal_code: '09900-000', total_area: 10000, useful_area: 8000)
    warehouse = Warehouse.create(name: 'Guarulhos 2', code: 'GRU 2', description: 'Ótimo galpão numa linda cidade',
      address: 'Praça 9', city: 'Guarulhos', state: 'SP',
      postal_code: '09900-000', total_area: 10000, useful_area: 8000)


    visit root_path
    fill_in 'Busca:', with: 'Guarulhos'
    click_on 'Pesquisar'

    expect(current_path).to eq search_path
    expect(page).to have_content('GRU')
    expect(page).to have_content('GRU 2')
    expect(page).not_to have_content('MCZ')
  end

  it 'e pesquisa por um galpão não cadastrado' do
    warehouse = Warehouse.create(name: 'Guarulhos 2', code: 'GRU 2', description: 'Ótimo galpão numa linda cidade',
      address: 'Praça 9', city: 'Guarulhos', state: 'SP',
      postal_code: '09900-000', total_area: 10000, useful_area: 8000)

    visit root_path
    fill_in 'Busca:', with: 'Maranhão'
    click_on 'Pesquisar'

    expect(current_path).to eq search_path
    expect(page).to have_content('Nenhum galpão encontrado')
  end
end