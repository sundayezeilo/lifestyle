class CategoriesController < ApplicationController
  before_action :authenticate_user! ,only: :home

  def index
    @categories = Category.preload(:articles)
  end

  def new
  end

  def create
    
  end
end
