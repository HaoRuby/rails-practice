class RemoveArticleIdFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :article_id
  end
end
