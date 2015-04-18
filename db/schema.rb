# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150418093316) do

  create_table "administrators", force: :cascade do |t|
    t.integer  "role_id",                limit: 4
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree
  add_index "administrators", ["role_id"], name: "index_administrators_on_role_id", using: :btree
  add_index "administrators", ["unlock_token"], name: "index_administrators_on_unlock_token", unique: true, using: :btree

  create_table "affixtures", force: :cascade do |t|
    t.integer  "affix_owner_id",   limit: 4
    t.string   "affix_owner_type", limit: 255
    t.integer  "affixable_id",     limit: 4
    t.string   "affixable_type",   limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "affixtures", ["affix_owner_type", "affix_owner_id"], name: "index_affixtures_on_affix_owner_type_and_affix_owner_id", using: :btree
  add_index "affixtures", ["affixable_type", "affixable_id"], name: "index_affixtures_on_affixable_type_and_affixable_id", using: :btree

  create_table "article_translations", force: :cascade do |t|
    t.integer  "article_id",       limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "title",            limit: 255
    t.text     "summary",          limit: 65535
    t.text     "body",             limit: 65535
    t.string   "meta_title",       limit: 255
    t.string   "meta_description", limit: 255
    t.string   "meta_keywords",    limit: 255
  end

  add_index "article_translations", ["article_id"], name: "index_article_translations_on_article_id", using: :btree
  add_index "article_translations", ["locale"], name: "index_article_translations_on_locale", using: :btree

  create_table "article_type_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   limit: 4, null: false
    t.integer "descendant_id", limit: 4, null: false
    t.integer "generations",   limit: 4, null: false
  end

  add_index "article_type_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "article_type_anc_desc_idx", unique: true, using: :btree
  add_index "article_type_hierarchies", ["descendant_id"], name: "article_type_desc_idx", using: :btree

  create_table "article_type_translations", force: :cascade do |t|
    t.integer  "article_type_id",  limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.string   "meta_title",       limit: 255
    t.string   "meta_description", limit: 255
    t.string   "meta_keywords",    limit: 255
  end

  add_index "article_type_translations", ["article_type_id"], name: "index_article_type_translations_on_article_type_id", using: :btree
  add_index "article_type_translations", ["locale"], name: "index_article_type_translations_on_locale", using: :btree

  create_table "article_types", force: :cascade do |t|
    t.string   "slug",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.integer  "sort_order", limit: 4
    t.boolean  "public",     limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_types", ["parent_id"], name: "index_article_types_on_parent_id", using: :btree
  add_index "article_types", ["public"], name: "index_article_types_on_public", using: :btree
  add_index "article_types", ["slug"], name: "index_article_types_on_slug", unique: true, using: :btree

  create_table "article_types_articles", id: false, force: :cascade do |t|
    t.integer "article_type_id", limit: 4
    t.integer "article_id",      limit: 4
  end

  add_index "article_types_articles", ["article_id"], name: "index_article_types_articles_on_article_id", using: :btree
  add_index "article_types_articles", ["article_type_id"], name: "index_article_types_articles_on_article_type_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "slug",         limit: 255
    t.boolean  "draft",        limit: 1,   default: false
    t.boolean  "featured",     limit: 1,   default: false
    t.boolean  "published",    limit: 1,   default: false
    t.datetime "published_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["featured"], name: "index_articles_on_featured", using: :btree
  add_index "articles", ["published"], name: "index_articles_on_published", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "data_files", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "file_type",     limit: 255
    t.string   "data_file",     limit: 255
    t.string   "content_type",  limit: 255
    t.integer  "file_size",     limit: 4
    t.integer  "position",      limit: 4,   default: 0
    t.boolean  "default_image", limit: 1,   default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "data_files", ["content_type"], name: "index_data_files_on_content_type", using: :btree
  add_index "data_files", ["default_image"], name: "index_data_files_on_default_image", using: :btree
  add_index "data_files", ["file_type"], name: "index_data_files_on_file_type", using: :btree
  add_index "data_files", ["position"], name: "index_data_files_on_position", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "sitemap_item_translations", force: :cascade do |t|
    t.integer  "sitemap_item_id", limit: 4,     null: false
    t.string   "locale",          limit: 255,   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
  end

  add_index "sitemap_item_translations", ["locale"], name: "index_sitemap_item_translations_on_locale", using: :btree
  add_index "sitemap_item_translations", ["sitemap_item_id"], name: "index_sitemap_item_translations_on_sitemap_item_id", using: :btree

  create_table "sitemap_item_types", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "controller",    limit: 255
    t.string   "rest_action",   limit: 255
    t.string   "sitemap_class", limit: 255
    t.string   "url",           limit: 255
    t.string   "external_url",  limit: 255
    t.string   "params",        limit: 255
    t.string   "icon",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitemap_items", force: :cascade do |t|
    t.integer  "sitemap_item_type_id",     limit: 4
    t.integer  "parent_id",                limit: 4
    t.integer  "sort_order",               limit: 4
    t.string   "slug",                     limit: 255
    t.string   "url_hash",                 limit: 255
    t.string   "sitemap_item_object_type", limit: 255
    t.integer  "sitemap_item_object_id",   limit: 4
    t.string   "css_celector",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sitemap_items", ["parent_id"], name: "index_sitemap_items_on_parent_id", using: :btree
  add_index "sitemap_items", ["sitemap_item_object_id"], name: "index_sitemap_items_on_sitemap_item_object_id", using: :btree
  add_index "sitemap_items", ["sitemap_item_object_type"], name: "index_sitemap_items_on_sitemap_item_object_type", using: :btree
  add_index "sitemap_items", ["slug"], name: "index_sitemap_items_on_slug", unique: true, using: :btree

  create_table "things", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "slug",        limit: 255,                 null: false
    t.string   "description", limit: 255
    t.boolean  "published",   limit: 1,   default: false
    t.boolean  "featured",    limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id",     limit: 4
  end

  add_index "things", ["type_id"], name: "index_things_on_type_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "slug",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
