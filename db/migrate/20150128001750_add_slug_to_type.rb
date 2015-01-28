class AddSlugToType < ActiveRecord::Migration
  def self.up
    add_column :types, :slug, :string, :null => false, :after => :title
    end
  def self.down
    remove_column  :types, :slug, :string
  end
end
