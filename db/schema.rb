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

ActiveRecord::Schema.define(version: 20160520141830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "os"
    t.string   "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "push_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "os"
    t.string   "push_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_push_tokens_on_user_id", using: :btree
  end

  create_table "social_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "url"
    t.string   "image_url"
    t.string   "description"
    t.text     "credentials"
    t.text     "raw_info"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_social_profiles_on_user_id", using: :btree
  end

  create_table "song_day_counts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.date     "date"
    t.integer  "skip_count"
    t.integer  "play_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_song_day_counts_on_song_id", using: :btree
    t.index ["user_id"], name: "index_song_day_counts_on_user_id", using: :btree
  end

  create_table "song_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "device_id"
    t.string   "media_id"
    t.string   "track_source"
    t.string   "album"
    t.integer  "duration"
    t.string   "genre"
    t.string   "album_art_uri"
    t.integer  "track_number"
    t.integer  "num_tracks"
    t.datetime "recorded_at"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "accuracy"
    t.float    "altitude"
    t.string   "record_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["device_id"], name: "index_song_histories_on_device_id", using: :btree
    t.index ["song_id"], name: "index_song_histories_on_song_id", using: :btree
    t.index ["user_id"], name: "index_song_histories_on_user_id", using: :btree
  end

  create_table "song_total_counts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.integer  "skip_count"
    t.integer  "play_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_song_total_counts_on_song_id", using: :btree
    t.index ["user_id"], name: "index_song_total_counts_on_user_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.text     "title"
    t.text     "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "auth_token"
  end

  add_foreign_key "devices", "users"
  add_foreign_key "push_tokens", "users"
  add_foreign_key "social_profiles", "users"
  add_foreign_key "song_day_counts", "songs"
  add_foreign_key "song_day_counts", "users"
  add_foreign_key "song_histories", "devices"
  add_foreign_key "song_histories", "songs"
  add_foreign_key "song_histories", "users"
  add_foreign_key "song_total_counts", "songs"
  add_foreign_key "song_total_counts", "users"
end
