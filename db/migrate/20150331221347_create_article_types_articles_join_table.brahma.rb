# This migration comes from brahma (originally 20150331220501)
class CreateArticleTypesArticlesJoinTable < ActiveRecord::Migration
  def up
    create_table :article_types_articles, id: false do |t|
      t.references :article_type
      t.references :article
    end
    add_index :article_types_articles, :article_type_id
    add_index :article_types_articles, :article_id

    remove_column :articles, :article_type_id
  end
  def down
   drop_table :article_types_articles
   end
end