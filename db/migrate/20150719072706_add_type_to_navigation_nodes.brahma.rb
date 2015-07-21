# This migration comes from brahma (originally 20150719072341)
class AddTypeToNavigationNodes < ActiveRecord::Migration
  def up
    add_column :navigation_nodes, :type, :string, after: 'id'
    add_index  :navigation_nodes, :type
  end
  def down
    remove_column :navigation_nodes, :type, :string, after: 'id'
  end
end