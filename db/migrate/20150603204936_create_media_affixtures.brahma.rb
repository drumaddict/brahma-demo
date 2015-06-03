# This migration comes from brahma (originally 20150603204900)
class CreateMediaAffixtures < ActiveRecord::Migration
 def up
    create_table :media_affixtures do |t|
       t.references :media_affix_owner, polymorphic: true , index: { name: 'media_owner_index' }
       t.references :medium
       t.timestamps null: false
       t.integer :position, default: 999
    end

    add_index :media_affixtures, :medium_id
    add_index :media_affixtures, [:media_affix_owner_id, :media_affix_owner_type], :unique => true, :name => 'media_owner_id_type_index'
  end

  def down
    drop_table :media_affixtures
  end
end
