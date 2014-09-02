class AddProductOrderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_order, :integer, default: 1000
  end
end
