require 'rails_helper'

describe 'Supplier API' do
  context 'GET /api/v1/supplier' do
    it 'com sucesso' do
      # Arrange
      Supplier.create!(fantasy_name: 'Fornecedor X', legal_name: 'Fornecedor X', cnpj: '00000000000000',
        email: 'emailfake@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')
      Supplier.create!(fantasy_name: 'Fornecedor Bom Jesus', legal_name: 'Fornecedor Bom Jesus', cnpj: '00000000000100',
        email: 'bomjesus@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')
  
      # Act
      get '/api/v1/suppliers'
  
      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]["fantasy_name"]).to eq 'Fornecedor X'
      expect(parsed_response[1]["fantasy_name"]).to eq 'Fornecedor Bom Jesus'
      expect(response.body).not_to include 'Av Diadema'
      expect(response.body).not_to include 'Av do Aeroporto'
    end
  
    it 'resposta vazia' do
      # Arrange
  
      # Act
      get '/api/v1/suppliers'
  
      # Assert
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response).to eq []
    end
  end

  context 'GET /api/v1/suppliers/:id' do
    it 'com sucesso' do
      # Arrange
      supplier = Supplier.create!(fantasy_name: 'Fornecedor Bom Jesus', legal_name: 'Fornecedor Bom Jesus', cnpj: '00000000000100',
        email: 'bomjesus@gmail.com', product: 'Fornecedor de materiais diversos', telephone: '(11) 00000-0000')

      # Act
      get "/api/v1/suppliers/#{supplier.id}"
      
      # Assert
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["fantasy_name"]).to eq 'Fornecedor Bom Jesus'
      expect(parsed_response["cnpj"]).to eq '00000000000100'
      expect(parsed_response["product"]).to eq 'Fornecedor de materiais diversos'
      expect(parsed_response.keys).not_to include 'created_at'
      expect(parsed_response.keys).not_to include 'updated_at'
    end

    it 'supplier dont exist' do
      # Arrange

      # Act
      get "/api/v1/suppliers/999"

      # Assert
      expect(response.status).to eq 404
    end
  end
end