class RemoveDescriptionFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :descrption, :string
  end
end
