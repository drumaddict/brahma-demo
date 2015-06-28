# This migration comes from brahma (originally 20150628214807)
class CreateSitemapNodes < ActiveRecord::Migration
  def self.up
    create_table :sitemap_nodes do |t|
      t.string  :slug
      t.integer :parent_id
      t.integer :sort_order
      t.string  :node_class
      t.string  :controller
      t.string  :action
      t.text    :url
      t.boolean :is_external_url
      t.string  :external_url
      t.timestamps
    end
    add_index :sitemap_nodes, :slug, unique: true
    add_index :sitemap_nodes, :parent_id
    add_index :sitemap_nodes, :sort_order


   SitemapNode.create_translation_table! title: :string, description: :text
  end
  def self.down
    drop_table :sitemap_nodes
    SitemapNode.drop_translation_table!
  end
end