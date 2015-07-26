# This migration comes from brahma (originally 20150726073746)
class CreateMediaCollections < ActiveRecord::Migration
  def self.up
    create_table :media_collections do |t|
      t.string  :slug
      t.boolean :active, default: false
      t.timestamps
    end
    add_index :media_collections, :slug, unique: true
    add_index :media_collections, :active

    MediaCollection.create_translation_table! title: :string, description: :text, meta_title: :string, meta_description: :string, meta_keywords: :string
  end

  def self.down
    drop_table :media_collections
    MediaCollection.drop_translation_table!
  end
end




