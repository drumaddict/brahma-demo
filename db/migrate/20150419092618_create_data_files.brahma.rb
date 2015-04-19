# This migration comes from brahma (originally 20150418084557)
class CreateDataFiles < ActiveRecord::Migration
  def up
    create_table :data_files do |t|
      t.string :link
      t.string :link_target
      t.string :file_type, index: true
      t.string :data_file
      t.string :content_type,  index: true
      t.integer :file_size
      t.integer :position,  index: true, default: 0
      t.boolean :default_image,  index: true, default: false
      t.timestamps null: false
    end

    DataFile.create_translation_table! title: :string, description: :text
  end

  def down
    drop_table :data_files
  end
end
