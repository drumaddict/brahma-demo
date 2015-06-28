class CreateSitemapNodeHierarchies < ActiveRecord::Migration
  def change
    create_table :sitemap_node_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :sitemap_node_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "sitemap_node_anc_desc_idx"

    add_index :sitemap_node_hierarchies, [:descendant_id],
      name: "sitemap_node_desc_idx"
  end
end
