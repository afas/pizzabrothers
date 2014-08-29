class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :price, :default => 100
      t.integer :price_classic, :default => 250
      t.integer :price_big, :default => 350
      t.integer :category_id

      t.timestamps
    end
  end
end
