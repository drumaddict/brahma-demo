class AddSlugToTitle < ActiveRecord::Migration
  def self.up
    add_column :things, :slug, :string, :null => false, :after => :title
    end
  def self.down
    remove_column  :things, :slug, :string
  end
end
