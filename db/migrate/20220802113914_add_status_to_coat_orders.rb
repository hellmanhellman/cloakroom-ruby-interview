class AddStatusToCoatOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :coat_orders, :sent, :boolean
    add_column :coat_orders, :status, :integer, default: 0
  end
end
