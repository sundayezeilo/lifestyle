class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def index
    @articles = Category.find_by(id: params[:category_id]).articles.preload([:votes, { image_attachment: :blob }])
    @category = Category.find_by(id: params[:category_id])
    store_location
  end

  def create
    @article = current_user.articles.build

    @article.title = article_params[:title]
    @article.text = article_params[:text]
    @article.categories << Category.where(id: article_params[:category_ids].reject(&:empty?).map(&:to_i))
    @article.image.attach(article_params[:image])

    if @article.save
      flash[:success] = 'New article was successfully created.'
      redirect_to categories_path
    else
      flash[:warning] = 'Article was not created.'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
