class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :article_id
      t.string :from
      t.string :title
      t.text :content
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
