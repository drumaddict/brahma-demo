# This migration comes from brahma (originally 20150322153216)
class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
       t.string :name
    end
    add_column :administrators, :role_id, :integer, after: 'id'
    add_index :administrators, :role_id
  end

  def down
     drop_table :roles
     remove_column :administrators, :role_id
  end
end
