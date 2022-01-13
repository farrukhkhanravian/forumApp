class RemoveProductIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :product_id, :string

  end
end
