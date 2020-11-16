module CategoriesHelper
  def load_image(article)
    if article.image.attached?
      rails_blob_url(article.image)
    else
      'assets/rails.svg'
    end
  end
end
