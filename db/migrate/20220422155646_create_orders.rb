class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.float :total_price
      t.date :order_date
      t.string :payment_status

      t.timestamps
    end
  end
end
