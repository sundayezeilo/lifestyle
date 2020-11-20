class CategoriesController < ApplicationController
  def index
    @categories = Category.fetch
    @most_voted_article = Article.fetch_most_voted
  end
end
