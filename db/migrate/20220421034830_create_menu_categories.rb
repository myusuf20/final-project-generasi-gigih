class CreateMenuCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_categories do |t|
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
