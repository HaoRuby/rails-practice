class PageController < ApplicationController
  def index
    @title = 'Crawl - Trang Chủ'
    @categories = Category.all
    # select all articles has top_post = true, and order by created time
    @articles = Article.where(top_post: true).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
