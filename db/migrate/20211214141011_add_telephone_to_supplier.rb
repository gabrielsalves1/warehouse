class AddTelephoneToSupplier < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :telephone, :string
  end
end
