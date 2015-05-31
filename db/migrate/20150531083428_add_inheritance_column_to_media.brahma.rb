# This migration comes from brahma (originally 20150531083220)
class AddInheritanceColumnToMedia < ActiveRecord::Migration
  def self.up
    add_column :media, :type, :string, :after => :third_party_media_id
    end
  def self.down
    remove_column  :media, :type
  end
end

