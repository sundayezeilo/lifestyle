class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.preload(articles: [{ image_attachment: :blob }]).orderby_priority
    @most_voted_article = Article.all.order(:votes_count).last
  end
end
