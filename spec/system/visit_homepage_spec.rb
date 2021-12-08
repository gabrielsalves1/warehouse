require 'rails_helper'

describe 'Visitante abre a tela inicial' do
  #Cenários
  it 'e vê o menu' do
    visit root_path

    expect(page).to have_content 'Boas vindas ao WareHouse App'
  end

  it 'e vê os galpões cadastrados' do
    Warehouse.new(name: 'Guarulhos', code: 'GRU').save()
    Warehouse.new(name: 'Porto Alegre', code: 'POA').save()
    Warehouse.new(name: 'São Luís', code: 'SLZ').save()
    Warehouse.new(name: 'Vitória', code: 'VIX').save()

    visit root_path
    expect(page).to have_content('Guarulhos')
    expect(page).to have_content('GRU')

    expect(page).to have_content('Porto Alegre')
    expect(page).to have_content('POA')

    expect(page).to have_content('São Luís')
    expect(page).to have_content('SLZ')

    expect(page).to have_content('Vitória')
    expect(page).to have_content('VIX')
  end
end