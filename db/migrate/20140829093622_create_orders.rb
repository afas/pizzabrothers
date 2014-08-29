class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email
      t.integer :cash_from
      t.text :comment
      t.integer :order_status_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
