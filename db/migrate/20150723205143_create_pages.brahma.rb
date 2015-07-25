# This migration comes from brahma (originally 20150723204013)
class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :page_type
      t.string :slug
      t.boolean :featured,    default: false
      t.boolean :published,   default: false
      t.timestamps
    end
    add_index :pages, :page_type_id
    add_index :pages, :slug, unique: true
    add_index :pages, :published
    add_index :pages, :featured

    Page.create_translation_table! title: :string, summary: :text, body: :text, meta_title: :string, meta_description: :string, meta_keywords: :string
  end

  def self.down
    drop_table :pages
    Page.drop_translation_table!
  end
end
