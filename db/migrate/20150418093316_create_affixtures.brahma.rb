class CreateAffixtures < ActiveRecord::Migration
  def up
    create_table :affixtures do |t|
       t.references :affix_owner, polymorphic: true , index: true
       t.references :affixable, polymorphic: true , index: true
       t.timestamps null: false
       t.integer :position, default: 0
    end

    add_index :affixtures, :affix_owner_id
    add_index :affixtures, :affixable_id
    add_index :affixtures, [:affix_owner_id, :affix_owner_type]
    add_index :affixtures, [:affixable_id, :affixable_type]
  end

  def down
    drop_table :affixtures
  end
end
