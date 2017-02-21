class CategoriesController < ApplicationController
  layout 'page'
  def show
    @categories = Category.all
    category = Category.find(params[:id])
    @articles = category.articles.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
