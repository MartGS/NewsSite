class DropCategoriesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :categories if table_exists?(:categories)
  end

  def down
    create_table :categories do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
