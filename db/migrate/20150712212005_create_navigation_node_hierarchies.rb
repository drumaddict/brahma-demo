class CreateNavigationNodeHierarchies < ActiveRecord::Migration
  def change
    create_table :navigation_node_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :navigation_node_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "navigation_node_anc_desc_idx"

    add_index :navigation_node_hierarchies, [:descendant_id],
      name: "navigation_node_desc_idx"
  end
end
