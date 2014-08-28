class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.float :price
      t.float :price_classic
      t.float :price_big
      t.integer :category_id

      t.timestamps
    end
  end
end
