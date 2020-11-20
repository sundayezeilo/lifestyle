module ArticlesHelper
  def fetch_truncated(text, word_count)
    truncate(text, length: word_count) { content_tag(:h6, content_tag(:a, 'Read More', href: '#', class: 'trunc-text')) }
  end
end
