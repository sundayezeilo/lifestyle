class RemoveIndexFromArticleCategory < ActiveRecord::Migration[6.0]
  def change
    remove_index :articles_categories, column: [:article_id, :category_id]
    
  end
end
