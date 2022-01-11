require 'rails_helper'

describe 'Warehouse API' do
  context 'GET /api/v1/warehouse' do
    it 'com sucesso - 200' do
      # Arrange
      Warehouse.create!(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                        state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')
      Warehouse.create!(name: 'Porto Alegre', code: 'POA', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Porto Alegre',
                          state: 'RS', postal_code: '00000-000', total_area: '4000', useful_area: '3500')

      # Act
      get '/api/v1/warehouses'

      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]["name"]).to eq 'Guarulhos'
      expect(parsed_response[1]["name"]).to eq 'Porto Alegre'
      expect(response.body).not_to include 'Av Diadema'
      expect(response.body).not_to include 'Av do Aeroporto'
    end

    it 'resposta vazia' do
      # Arrange

      # Act
      get '/api/v1/warehouses'

      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response).to eq []
    end
  end

  context 'GET /api/v1/warehouses/:id' do
    it 'com sucesso - 200' do
      # Arrange
      warehouse = Warehouse.create!(name: 'Guarulhos', code: 'GRU', description: 'Teste cadastrar galpão', address: 'Rua Teste', city: 'Guarulhos',
                                    state: 'SP', postal_code: '00000-000', total_area: '3000', useful_area: '2000')

      # Act
      get "/api/v1/warehouses/#{warehouse.id}"

      # Assert
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["name"]).to eq 'Guarulhos'
      expect(parsed_response["code"]).to eq 'GRU'
      expect(parsed_response["city"]).to eq 'Guarulhos'
      expect(parsed_response.keys).not_to include 'created_at'
    end

    it 'warehouse não existe - 404' do
      # Arrange

      # Act
      get "/api/v1/warehouses/999"

      # Assert
      expect(response.status).to eq 404
      expect(response.content_type).to include('application/json')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["error"]).to eq 'Objeto não encontrado'
    end
  end

  context 'POST /api/v1/warehouses' do
    it 'com sucesso' do
      # Arrange
      c = Category.create!(name: "Eletrônico")

      # Act
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/warehouses', params: '{ "name": "Maceió",
                                            "code": "MCZ",
                                            "description": "Ótimo galpão numa linda cidade",
                                            "address": "Avenida dos Galpões, 1000",
                                            "city": "Maceió",
                                            "state": "AL",
                                            "postal_code": "57050-000",
                                            "total_area": 10000,
                                            "useful_area": 8000,
                                            "category_ids": 1}',
                                 headers: headers


      # Assert
      expect(response.status).to eq 201
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["id"]).to be_a_kind_of(Integer)
      expect(parsed_response["name"]).to eq 'Maceió'
      expect(parsed_response["code"]).to eq 'MCZ'
    end

    it 'campos obrigatórios' do
      # Arrange

      # Act
      headers = {"CONTENT_TYPE" => "application/json"}
      post '/api/v1/warehouses', params: '{ "name": "Maceió",
                                              "code": "MCZ",
                                              "description": "Ótimo galpão numa linda cidade",
                                              "address": "Avenida dos Galpões, 1000",
                                              "city": "Maceió",
                                              "state": "AL",
                                              "postal_code": "57050-000",
                                              "total_area": 10000}',
                                   headers: headers

      # Assert
      expect(response.status).to eq 422
      expect(response.body).to include 'Área Útil não pode ficar em branco'
    end
  end
end
