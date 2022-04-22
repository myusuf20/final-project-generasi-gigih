class DropTableOrderDetail < ActiveRecord::Migration[7.0]
  def change
    drop_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.float :price, null: false
      t.timestamps null: false
    end
  end
end
