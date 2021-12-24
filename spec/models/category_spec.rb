require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Categoria não pode ser registrada' do
    it 'e não cadastra pois os campos são obrigatórios' do
      # Arrange
      category = Category.create(name: '')

      # Act
      result = category.valid?

      # Assert
      expect(result).to eq false
    end
  end
end
