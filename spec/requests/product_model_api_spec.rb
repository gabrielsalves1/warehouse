require 'rails_helper'

describe 'Supplier API' do
  context 'GET /api/v1/product_models' do
    it 'com sucesso' do
      # Arrange
      supplier = Supplier.create!(fantasy_name: 'Cerâmicas Geek', legal_name: 'Geek Comércio de Cerâmicas LTDA',
        cnpj: '00000000000000', email: 'a@gmail.com', product: 'Cerâmicas')
      category = Category.create!(name: 'Geek')
      ProductModel.create!(name: 'Lego', weight: '10', height: '10', length: '5', width: '5', supplier: supplier, category: category)
      ProductModel.create!(name: 'Caneca', weight: '10', height: '10', length: '5', width: '5', supplier: supplier, category: category)
  
      # Act
      get '/api/v1/product_models'
  
      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]["name"]).to eq 'Lego'
      expect(parsed_response[1]["name"]).to eq 'Caneca'
      expect(response.body).not_to include 'Av Diadema'
      expect(response.body).not_to include 'Av do Aeroporto'
    end

    it 'resposta vazia' do
      # Arrange
  
      # Act
      get '/api/v1/product_models'
  
      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response).to eq []
    end
  end

  context 'GET /api/v1/product_models/:id' do
    it 'com sucesso' do
      # Arrange
      supplier = Supplier.create!(fantasy_name: 'Fornecedor Bom Jesus', legal_name: 'Fornecedor Bom Jesus', cnpj: '00000000000100',
        email: 'bomjesus@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')
      category = Category.create!(name: 'Geek')
      product_model = ProductModel.create!(name: 'Caneca', weight: '10', height: '10', length: '5', width: '5', supplier: supplier, category: category)

      # Act
      get "/api/v1/product_models/#{product_model.id}"

      # Assert
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["name"]).to eq 'Caneca'
      expect(parsed_response["weight"]).to eq 10
      expect(parsed_response.keys).not_to include 'created_at'
      expect(parsed_response.keys).not_to include 'updated_at'
    end

    it 'modelo de produto não existe' do
      # Arrange

      # Act
      get "/api/v1/product_models/999"

      # Assert
      expect(response.status).to eq 404
    end
  end
end