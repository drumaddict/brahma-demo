# This migration comes from brahma (originally 20150720215832)
class AddSlugToMedia < ActiveRecord::Migration
   def up
    add_column :media, :slug, :string, after: 'id'
    add_index  :media, :slug
  end
  def down
    remove_column :media, :slug
  end
end