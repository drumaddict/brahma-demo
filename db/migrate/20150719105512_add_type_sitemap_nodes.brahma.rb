# This migration comes from brahma (originally 20150719105351)
class AddTypeSitemapNodes < ActiveRecord::Migration
  def up
    add_column :sitemap_nodes, :type, :string, after: 'id'
    add_index  :sitemap_nodes, :type
  end
  def down
    remove_column :sitemap_nodes, :type, :string, after: 'id'
  end
end
