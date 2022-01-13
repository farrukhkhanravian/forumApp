class AddResourceCatToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :resourcecat_type, :string
    add_column :categories, :resourcecat_id, :integer
  end
end
