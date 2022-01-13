class AddCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :categoryType, :string
  end
end
