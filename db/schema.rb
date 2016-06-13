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

ActiveRecord::Schema.define(version: 20160613222630) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 255,   null: false
    t.string   "description", limit: 255
    t.binary   "image",       limit: 65535
    t.string   "url",         limit: 255,   null: false
    t.integer  "score",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "author_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "classifications", ["author_id"], name: "index_classifications_on_author_id", using: :btree
  add_index "classifications", ["book_id"], name: "index_classifications_on_book_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.date     "date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["book_id"], name: "index_favorites_on_book_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reads", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "story_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reads", ["story_id"], name: "index_reads_on_story_id", using: :btree
  add_index "reads", ["user_id"], name: "index_reads_on_user_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "chapter",    limit: 4
    t.integer  "number",     limit: 4,     null: false
    t.string   "title",      limit: 255,   null: false
    t.binary   "image",      limit: 65535
    t.string   "url",        limit: 255,   null: false
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "stories", ["book_id"], name: "index_stories_on_book_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "age",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "pass",           limit: 255, null: false
    t.string   "name",           limit: 255, null: false
    t.string   "gender",         limit: 255
    t.date     "birthday"
    t.string   "email",          limit: 255, null: false
    t.boolean  "notice_confide"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "writings", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "author_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "writings", ["author_id"], name: "index_writings_on_author_id", using: :btree
  add_index "writings", ["book_id"], name: "index_writings_on_book_id", using: :btree

  add_foreign_key "classifications", "authors"
  add_foreign_key "classifications", "books"
  add_foreign_key "favorites", "books"
  add_foreign_key "favorites", "users"
  add_foreign_key "reads", "stories"
  add_foreign_key "reads", "users"
  add_foreign_key "stories", "books"
  add_foreign_key "writings", "authors"
  add_foreign_key "writings", "books"
end
