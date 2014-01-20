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

ActiveRecord::Schema.define(version: 20131210140939) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "avatar_url"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cup_members", force: true do |t|
    t.integer  "cup_id"
    t.integer  "user_id"
    t.integer  "placement"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
    t.integer  "character_id"
    t.string   "state"
  end

  create_table "cups", force: true do |t|
    t.integer  "user_id"
    t.integer  "winning_user_id"
    t.string   "motor_class"
    t.string   "com"
    t.string   "items"
    t.integer  "num_tracks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.string   "apn_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: true do |t|
    t.integer  "user_id"
    t.integer  "character_id"
    t.integer  "vehicle_id"
    t.integer  "win_count"
    t.integer  "drive_count"
    t.integer  "total_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points_per_race"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "api_key",                             null: false
    t.string   "nickname"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "win_count"
    t.integer  "drive_count"
    t.integer  "total_points"
    t.integer  "points_per_race"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: true do |t|
    t.string   "name"
    t.string   "vehicle_type"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

end
