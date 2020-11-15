class CreateJoinTableArticlesCategories < ActiveRecord::Migration[6.0]
  def change
    
    create_table :articles_categories, id: false do |t|
      t.bigint :article_id
      t.bigint :category_id
    end 
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end
end
