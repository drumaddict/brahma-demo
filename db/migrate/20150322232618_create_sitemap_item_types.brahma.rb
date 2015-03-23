# This migration comes from brahma (originally 20150322000758)
class CreateSitemapItemTypes < ActiveRecord::Migration
  def self.up
    create_table :sitemap_item_types do |t|
      t.string :title
      t.string :controller
      t.string :rest_action
      t.string :sitemap_class
      t.string :url
      t.string :external_url
      t.string :params
      t.string :icon
      t.timestamps
    end
  end

  def self.down
     drop_table :sitemap_item_types
  end
end