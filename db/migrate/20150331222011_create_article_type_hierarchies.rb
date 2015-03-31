class CreateArticleTypeHierarchies < ActiveRecord::Migration
  def change
    create_table :article_type_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :article_type_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "article_type_anc_desc_idx"

    add_index :article_type_hierarchies, [:descendant_id],
      name: "article_type_desc_idx"
  end
end
