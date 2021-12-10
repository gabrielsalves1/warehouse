require 'rails_helper'

describe 'Visitante abre a tela inicial' do
  #Cenários
  it 'e vê o menu' do
    visit root_path

    expect(page).to have_css('h1', text: 'WareHouse App')
    expect(page).to have_css('h3', text: 'Boas vindas ao sistema de gestão de estoques')
  end

  it 'e vê os galpões cadastrados' do
    Warehouse.new(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                  state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000').save()
    Warehouse.new(name: 'Porto Alegre', code: 'POA', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Porto Alegre',
                  state: 'RS', postal_code: '00000-000', total_area: '4000', useful_area: '3500').save()

    visit root_path
    expect(page).to have_content('Galpões cadastrados')
    expect(page).to have_content('Guarulhos')
    expect(page).to have_content('GRU')

    expect(page).to have_content('Porto Alegre')
    expect(page).to have_content('POA')
  end
end