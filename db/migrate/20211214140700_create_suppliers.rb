class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :fantasy_name
      t.string :legal_name
      t.string :cnpj
      t.string :email
      t.string :product

      t.timestamps
    end
  end
end
