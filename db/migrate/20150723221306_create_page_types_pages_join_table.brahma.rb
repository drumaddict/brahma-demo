# This migration comes from brahma (originally 20150723220915)
class CreatePageTypesPagesJoinTable < ActiveRecord::Migration
  def up
    create_table :page_types_pages, id: false do |t|
      t.references :page_type
      t.references :page
    end
    add_index :page_types_pages, :page_type_id
    add_index :page_types_pages, :page_id

    remove_column :pages, :page_type_id
  end
  def down
   drop_table :page_types_pages
   end
end
