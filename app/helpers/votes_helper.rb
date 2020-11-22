module VotesHelper
  def vote_up(text, article_id)
    link_to(text.html_safe, votes_url(article_id: article_id), method: :post, class: 'vote-up')
  end

  def vote_down(text, article_id)
    link_to(text.html_safe, votes_url(article_id: article_id), method: :delete, class: 'vote-down')
  end
end
