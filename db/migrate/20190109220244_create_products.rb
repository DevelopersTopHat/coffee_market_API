class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.integer :inventory_count
      t.text :description
      
      t.timestamps
    end
  end
end
