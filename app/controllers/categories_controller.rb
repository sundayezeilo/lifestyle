class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.preload(articles: [{ image_attachment: :blob }])
    @highest_voted_article = Article.all.order('votes_count DESC').first
  end
end
