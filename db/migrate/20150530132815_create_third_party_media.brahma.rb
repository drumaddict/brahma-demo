# This migration comes from brahma (originally 20150530132521)
class CreateThirdPartyMedia < ActiveRecord::Migration
  def up
    create_table :third_party_media do |t|
      t.string :title
      t.string :description
      t.timestamps null: false
    end

  end

  def down
    drop_table :third_party_media
  end
end


