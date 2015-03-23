# This migration comes from brahma (originally 20150315221908)
class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.references :article_type
      t.string :slug
      t.boolean :draft,       default: false
      t.boolean :featured,    default: false
      t.boolean :published,   default: false
      t.datetime :published_at
      t.datetime :expires_at
      t.timestamps
    end
    add_index :articles, :article_type_id
    add_index :articles, :slug, unique: true
    add_index :articles, :published
    add_index :articles, :featured

    Article.create_translation_table! title: :string, summary: :text, body: :text, meta_title: :string, meta_description: :string, meta_keywords: :string
  end

  def self.down
    drop_table :articles
    Article.drop_translation_table!
  end
end