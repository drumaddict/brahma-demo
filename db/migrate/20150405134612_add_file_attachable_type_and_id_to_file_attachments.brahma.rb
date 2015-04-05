# This migration comes from brahma (originally 20150405133355)
class AddFileAttachableTypeAndIdToFileAttachments < ActiveRecord::Migration
  def up
   add_column :file_attachments, :file_attachable_id, :integer, :after => :id
   add_column :file_attachments, :file_attachable_type, :string, :after => :file_attachable_id
  end

  def down
    remove_column :file_attachments, :file_attachable_id
    remove_column :file_attachments, :file_attachable_type
  end
end
