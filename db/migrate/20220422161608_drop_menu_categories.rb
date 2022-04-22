class DropMenuCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :menu_categories do |t|
      t.integer :item_id, null: false
      t.integer :category_id, null: false
      t.timestamps null: false
    end
  end
end
