class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def index
    @articles = Category.first.articles
  end

  def create
    article = current_user.articles.build(article_params)

    article.title = article_params[:title]
    article.text = article_params[:text]
    article.categories << Category.where(id: article_params[:category_ids].map(&:to_i))
    article.image.attach(article_params[:image])

    if article.save
      flash[:success] = 'New article was successfully created.'
      redirect_to root_path
    else
      flash[:danger] = 'Article was not created.'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_ids => [])
  end
end
