module CategoriesHelper
  def load_image(article = nil)
    if article&.image&.attached?
      if Rails.env.production?
        article.image.service_url
      else
        rails_blob_url(article.image)
      end
    else
      'https://www.sortiraparis.com/images/80/83517/577986-visuel-paris-velo-quai-2.jpg'
    end
  end
end
