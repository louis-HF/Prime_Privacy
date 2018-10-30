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

ActiveRecord::Schema.define(version: 2018_10_30_110835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_keywords", force: :cascade do |t|
    t.bigint "content_id"
    t.bigint "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_content_keywords_on_content_id"
    t.index ["keyword_id"], name: "index_content_keywords_on_keyword_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "external_provider"
    t.text "external_id"
    t.date "external_created_date"
    t.date "external_edit_date"
    t.date "external_deleted_date"
    t.string "file_type"
    t.boolean "selected"
    t.integer "coef_total"
    t.bigint "user_id"
    t.date "scan_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "text_publication"
    t.string "url_image"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_keywords_on_topic_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "rank"
    t.bigint "user_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_preferences_on_topic_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "facebook_token"
    t.string "twitter_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "content_keywords", "contents"
  add_foreign_key "content_keywords", "keywords"
  add_foreign_key "contents", "users"
  add_foreign_key "keywords", "topics"
  add_foreign_key "preferences", "topics"
  add_foreign_key "preferences", "users"
  add_foreign_key "topics", "users"
end
