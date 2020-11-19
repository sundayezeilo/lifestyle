module CategoriesHelper
  def load_image(article = nil)
    if article&.image&.attached?
      rails_blob_url(article.image)
    else
      'https://www.sortiraparis.com/images/80/83517/577986-visuel-paris-velo-quai-2.jpg'
    end
  end
end
