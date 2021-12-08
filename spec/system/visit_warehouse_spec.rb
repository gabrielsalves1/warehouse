require 'rails_helper'

describe 'Visitante vê um galpão' do
  it 'e vê todos dados cadastrados' do
    #Arrange -> preparar o banco
    Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
                      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
                      postal_code: '57050-000', total_area: 10000, useful_area: 8000)

    #Act -> Agir/executar algo
    visit root_path
    click_on 'Maceió'

    #Assert -> Validar/esperar que algo aconteça
    expect(page).to have_content('Maceió')
    expect(page).to have_content('MCZ')
    expect(page).to have_content('Ótimo galpão numa linda cidade')
    expect(page).to have_content('Av Fernandes Lima')
    expect(page).to have_content('CEP: 57050-000')
    expect(page).to have_content('Maceió/AL')
    expect(page).to have_content('Área Total: 10000 m2')
    expect(page).to have_content('Área Útil: 8000 m2')
    #expect(page).to have_link('Voltar', href: root_path)
  end

  it 'e consegue voltar para a tela inicial' do
    # Arrange -> preparar o banco
    Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
                      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
                      postal_code: '57050-000', total_area: 10000, useful_area: 8000)

    # Act -> Agir/executar algo
    visit root_path
    click_on 'Maceió'
    click_on 'Voltar'

    # Assert
    expect(current_path).to eq root_path
  end

  it 'e não vê todos detalhes do galpão' do
    #Arrange
    Warehouse.create(name: 'Maceió', code: 'MCZ', description: 'Ótimo galpão numa linda cidade',
                      address: 'Av Fernandes Lima', city: 'Maceió', state: 'AL',
                      postal_code: '57050-000', total_area: 10000, useful_area: 8000)

    #Act
    visit root_path

    #Assert
    expect(page).not_to have_content('Ótimo galpão numa linda cidade')
    expect(page).not_to have_content('Av Fernandes Lima')
    expect(page).not_to have_content('Maceió/AL')
    expect(page).not_to have_content('57050-000')
  end
end