class AddSummPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :summ_price, :integer
  end
end
