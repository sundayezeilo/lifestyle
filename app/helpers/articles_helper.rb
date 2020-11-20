module ArticlesHelper
  def fetch_truncated(text, word_count)
    truncate(text, length: word_count) do
      content_tag(:h6, content_tag(:a,
                                   'Read More', href: '#', class: 'trunc-text'))
    end
  end

  def show_image(article)
    if article && article.image.attached?
      image_tag(article.display_image)
    else
      image_tag("https://www.sortiraparis.com/images/80/83517/577986-visuel-paris-velo-quai-2.jpg", alt: "default image")
    end    
  end
end
