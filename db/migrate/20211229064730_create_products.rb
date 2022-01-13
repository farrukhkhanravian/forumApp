class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
