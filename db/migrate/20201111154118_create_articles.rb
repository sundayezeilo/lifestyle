class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.string :title
      t.string :text

      t.timestamps
    end
    add_index :articles, :author_id
  end
end
