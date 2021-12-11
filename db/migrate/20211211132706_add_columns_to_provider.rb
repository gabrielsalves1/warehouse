class AddColumnsToProvider < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :telephone, :string
  end
end
