# This migration comes from brahma (originally 20150418084557)
class CreateDataFiles < ActiveRecord::Migration
  def up
    create_table :data_files do |t|
      t.string :title
      t.string :file_type, index: true
      t.string :data_file
      t.string :content_type,  index: true
      t.integer :file_size
      t.integer :position,  index: true, default: 0
      t.boolean :default_image,  index: true, default: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :data_files
  end
end
