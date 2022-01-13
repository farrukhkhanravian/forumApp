class AddResourceToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :resource_type, :string
    add_column :products, :resource_id, :integer
  end
end
