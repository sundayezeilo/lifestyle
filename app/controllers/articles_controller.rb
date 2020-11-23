class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @article = Article.new
  end

  def index
    @articles = Category.find_by(id: params[:category_id]).articles.preload(
      [:votes, { image_attachment: :blob }]
    ).order_most_recent
    @category = Category.find_by(id: params[:category_id])
    store_location
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'New article was successfully created.'
      redirect_to categories_path
    else
      flash.now[:danger] = @article.errors.full_messages[0]
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
