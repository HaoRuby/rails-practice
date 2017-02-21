ActiveAdmin.register Article do
  menu label: 'Bài Viết'
  actions :all, except: [:new, :create]

  index do
    selectable_column
    column :title
    column :content
    column :from
    column :top_post
    column :created_at
    column :newest
  end

  # Mask the selected article to top post
  batch_action :mask_as_top_post do |selection|
    Article.find(selection).each do |article|
      article.toggle :top_post
      article.save
    end
    redirect_to admin_articles_path
  end

  # add update_articles method for Article_admin menu item
  action_item do
    link_to 'Update Articles', update_articles_admin_articles_path
  end

  collection_action :update_articles, method: :get do
    Article.get_life_news
    Article.get_beauty_news
    Article.get_start_news
    redirect_to admin_articles_path
  end

end
