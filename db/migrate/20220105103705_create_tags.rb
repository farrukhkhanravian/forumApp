class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name ,array: true, default: []

      t.timestamps
    end
  end
end
