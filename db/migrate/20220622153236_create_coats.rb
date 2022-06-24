class CreateCoats < ActiveRecord::Migration[6.1]
  def change
    create_table :coats do |t|
      t.string :name
      t.string :inventory_id
      t.integer :price
      t.timestamps
    end
  end
end
