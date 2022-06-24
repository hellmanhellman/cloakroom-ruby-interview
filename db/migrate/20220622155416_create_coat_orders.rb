class CreateCoatOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :coat_orders do |t|
      t.belongs_to :coat
      t.string :email
      t.boolean :sent, default: false
      t.timestamps
    end
  end
end
