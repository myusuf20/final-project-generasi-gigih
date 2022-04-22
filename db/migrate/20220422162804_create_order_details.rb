class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details, primary_key: [:order_id, :menu_item_id] do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :menu_item, index: true, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
