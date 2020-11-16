class ResetAllArticleCacheCounters < ActiveRecord::Migration[6.0]
  def up
    Article.all.each do |article|
      Article.reset_counters(article.id, :votes)
    end
  end

  def down
    # no rollback needed
  end
end
