# This migration comes from brahma (originally 20150322001748)
class CreateArticleTypes < ActiveRecord::Migration
  def self.up
    create_table :article_types do |t|
      t.string  :slug
      t.integer :parent_id
      t.integer :sort_order
      t.boolean :public, default: false
      t.timestamps
    end
    add_index :article_types, :slug, unique: true
    add_index :article_types, :parent_id
    add_index :article_types, :public

    ArticleType.create_translation_table! title: :string, description: :text, meta_title: :string, meta_description: :string, meta_keywords: :string
  end

  def self.down
    drop_table :article_types
    ArticleType.drop_translation_table!
  end
end

# == Schema Information
#
# Table name: article_groups
#
#  id                 :integer          not null, primary key
#  slug               :string(255)
#  ancestry           :string(255)
#  ancestry_depth     :integer          default(0)
#  titles_depth_cache :string(255)
#  css_class          :string(255)
#  private            :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null