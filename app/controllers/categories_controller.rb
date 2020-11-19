class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.preload(articles: [{ image_attachment: :blob }]).order_by_priority.limit(4)
    @most_voted_article = Article.preload({ image_attachment: :blob }).order('votes_count DESC').order_most_recent[0]
  end
end
