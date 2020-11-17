module CategoriesHelper
  def load_image(article = nil)
    if article&.image&.attached?
      rails_blob_url(article.image)
    else
      'assets/paris.jpeg'
    end
  end
end
