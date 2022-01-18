require 'rails_helper'

describe 'WarehouseRequests', type: :request do
  it 'should refuse Warehouse creation if unanthenticated' do
    # Arrange

    # Act
    post '/warehouses'

    # Assert
    expect(response.status).to eq 302
    expect(response.redirect_url).to eq new_user_session_url
  end
end