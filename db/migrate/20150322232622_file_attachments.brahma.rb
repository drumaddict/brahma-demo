# This migration comes from brahma (originally 20150322155242)
class FileAttachments < ActiveRecord::Migration
  def up
    create_table :file_attachments, :force => true do |t|
      t.string   :type
      t.string   :title
      t.string   :attachment
      t.string   :content_type
      t.integer  :file_size
      t.integer  :position, default: 0
      t.boolean  :is_default, default: false
      t.timestamps
    end
    add_index :file_attachments, :content_type
    add_index :file_attachments, :type

  end

  def down
    drop_table :file_attachments
  end

end


  # create_table "assets_folders", :id => false, :force => true do |t|
  #   t.integer "asset_id"
  #   t.integer "folder_id"
  # end

  # add_index "assets_folders", ["asset_id"], :name => "index_assets_folders_on_asset_id"
  # add_index "assets_folders", ["folder_id"], :name => "index_assets_folders_on_folder_id"