class ChangeTypeDataPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :menu_items, :price, :float
  end
end
