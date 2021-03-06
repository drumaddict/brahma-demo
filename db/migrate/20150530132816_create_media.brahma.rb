# This migration comes from brahma (originally 20150530132543)
class CreateMedia < ActiveRecord::Migration
  def up
    create_table :media do |t|
      t.references :third_party_medium, null: true
      t.string :third_party_media_code, index: true
      t.string :type
      t.string :filename
      t.string :link
      t.string :link_target
      t.string :medium
      t.string :checksum
      t.integer :duration
      t.integer :bitrate
      t.string :file_type, index: true
      t.string :content_type,  index: true
      t.integer :file_size
      t.integer :position,  index: true, default: 999

      t.timestamps null: false
    end

    Medium.create_translation_table! title: :string, description: :text, third_party_media_code: :string, link: :string
  end

  def down
    drop_table :media
    drop_table :medium_translations
  end
end

