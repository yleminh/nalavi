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

ActiveRecord::Schema.define(version: 20160713042442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.boolean  "delete_flag"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "book_languages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "delete_flag"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "book_languages", ["slug"], name: "index_book_languages_on_slug", unique: true, using: :btree

  create_table "book_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.boolean  "delete_flag"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cover_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.boolean  "delete_flag"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypt_password"
    t.string   "salt"
    t.string   "provider"
    t.integer  "role_id"
    t.boolean  "delete_flag"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
