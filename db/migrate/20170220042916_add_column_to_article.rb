class AddColumnToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :top_post, :boolean, default: false
  end
end
