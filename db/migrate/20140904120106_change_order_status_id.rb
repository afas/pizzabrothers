class ChangeOrderStatusId < ActiveRecord::Migration
  def change
    change_column :orders, :order_status_id, :integer, default: 0
  end
end
