class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.preload(:articles)
    @highest_voted_article = Article.preload(:votes).order(:votes_count).first
  end

end
