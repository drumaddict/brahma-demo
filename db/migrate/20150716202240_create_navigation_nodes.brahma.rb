# This migration comes from brahma (originally 20150712203149)
class CreateNavigationNodes < ActiveRecord::Migration
  def self.up
    create_table :navigation_nodes do |t|
      t.references :sitemap_node
      t.string     :slug
      t.boolean    :is_root, default: false
      t.integer    :parent_id
      t.integer    :sort_order
      t.text       :url
      t.boolean    :is_external_url
      t.string     :external_url
      t.boolean    :visible, default: false
      t.string     :anchor_id
      t.string     :li_id
      t.timestamps
    end
    add_index :navigation_nodes, :slug, unique: true
    add_index :navigation_nodes, :parent_id
    add_index :navigation_nodes, :sort_order


   NavigationNode.create_translation_table! title: :string
  end
  def self.down
    drop_table :navigation_nodes
    NavigationNode.drop_translation_table!
  end
end
