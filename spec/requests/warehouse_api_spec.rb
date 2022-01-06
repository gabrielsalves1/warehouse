require 'rails_helper'

describe 'Warehouse API' do
  it 'GET /warehouses' do
    # Arrange
    Warehouse.create!(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
      state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
    Warehouse.create!(name: 'Porto Alegre', code: 'POA', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Porto Alegre',
      state: 'RS', postal_code: '00000-000', total_area: '4000', useful_area: '3500')

    # Act
    get '/api/warehouses'

    # Assert
    expect(response).to have_http_status(200)
    expect(response.content_type).to have_http_status(200)
    expect(response.body).to include 'Maceió'
    expect(response.body).to include 'Guarulhos'
  end
end