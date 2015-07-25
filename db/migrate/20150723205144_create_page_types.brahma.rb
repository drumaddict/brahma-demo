# This migration comes from brahma (originally 20150723204109)
class CreatePageTypes < ActiveRecord::Migration
  def self.up
    create_table :page_types do |t|
      t.string  :slug
      t.integer :parent_id
      t.integer :sort_order
      t.boolean :public, default: false
      t.timestamps
    end
    add_index :page_types, :slug, unique: true
    add_index :page_types, :parent_id
    add_index :page_types, :public

    PageType.create_translation_table! title: :string, description: :text, meta_title: :string, meta_description: :string, meta_keywords: :string
  end

  def self.down
    drop_table :page_types
    PageType.drop_translation_table!
  end
end
