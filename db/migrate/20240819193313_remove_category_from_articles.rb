class RemoveCategoryFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :category_id, :integer
  end
end
