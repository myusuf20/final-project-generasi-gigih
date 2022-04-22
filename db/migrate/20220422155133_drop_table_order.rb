class DropTableOrder < ActiveRecord::Migration[7.0]
  def change
    drop_table :orders do |t|
      t.integer :customer_id, null: false
      t.float :total_price, null: false
      t.date :order_date, null: false
      t.string :payment_status, null: false
      t.timestamps null: false
    end
  end
end
