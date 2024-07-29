# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :source, null: false
      t.string :link
      t.text :html, null: false
      t.string :age_group

      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
