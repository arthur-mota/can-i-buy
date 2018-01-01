class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :url
      t.float :progress
      t.float :price

      t.timestamps
    end
  end
end
