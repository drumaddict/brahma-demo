# This migration comes from brahma (originally 20150322130130)
class CreateSitemapItems < ActiveRecord::Migration
  def up
    create_table :sitemap_items do |t|
      t.references :sitemap_item_type
      t.integer    :parent_id
      t.integer    :sort_order
      t.string     :slug
      t.string     :url_hash
      t.string     :sitemap_item_object_type
      t.integer    :sitemap_item_object_id
      t.string     :css_celector
      t.timestamps
    end

    add_index :sitemap_items, :slug, unique: true
    add_index :sitemap_items, :parent_id
    add_index :sitemap_items, :sitemap_item_object_type
    add_index :sitemap_items, :sitemap_item_object_id

    SitemapItem.create_translation_table! title: :string, description: :text
  end

  def down
    drop_table :sitemap_items
    SitemapItem.drop_translation_table!
  end
end


