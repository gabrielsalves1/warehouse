User.create!(email: 'teste132@email.com', password: '12345678')
supplier = Supplier.create!(fantasy_name: 'Vinícola Miolo', legal_name: 'Miolo Fábrica de Bebidas LTDA', cnpj: '51905325000154', email: 'contato@miolos.com', product: 'Fornecedor de Bebidas', telephone: '(11) 94102-0000')
category = Category.create!(name: 'Vinho')
Warehouse.create(name: 'Guarulhos 2', code: 'GRU 2', description: 'Ótimo galpão numa linda cidade',
  address: 'Praça 9', city: 'Guarulhos', state: 'SP',
  postal_code: '09900-000', total_area: 10000, useful_area: 8000, category_ids: category.id)
Category.create!(name: 'Geek')
ProductModel.create!(name: 'Vinho Tinto Miolo', height: '30', width: '10', length: '10', weight: 800, supplier: supplier, category: category)
ProductModel.create!(name: 'Taça para Vinho', height: '12', width: '10', length: '10', weight: 50, supplier: supplier, category: category)
ProductModel.create!(name: 'Vinho Branco Miolo', height: '30', width: '10', length: '10', weight: 800, supplier: supplier, category: category)