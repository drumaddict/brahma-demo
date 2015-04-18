# This migration comes from brahma (originally 20150418092323)
class CreateAffixtures < ActiveRecord::Migration
  def up
    create_table :affixtures do |t|
       t.references :affix_owner, polymorphic: true , index: true
       t.references :affixable, polymorphic: true , index: true
       t.timestamps null: false
    end
  end

  def down
    drop_table :affixtures
  end
end