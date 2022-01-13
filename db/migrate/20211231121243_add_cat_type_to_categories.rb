class AddCatTypeToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :catType, :string
  end
end
