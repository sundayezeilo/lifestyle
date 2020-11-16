module CategoriesHelper
  def load_image(article)
    if article.image.attached?
      rails_blob_url(article.image)
    else
      Rails.env.development? ? 'assets/rails.svg' : 'https://cdn.learnenough.com/rails.svg'
    end
  end
end
