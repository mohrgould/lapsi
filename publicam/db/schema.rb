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

ActiveRecord::Schema.define(version: 20141114063622) do

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cameras", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "last_frame_id"
    t.string   "description"
  end

  add_index "cameras", ["name"], name: "index_cameras_on_name", unique: true
  add_index "cameras", ["user_id"], name: "index_cameras_on_user_id"

  create_table "frames", force: true do |t|
    t.integer  "ts"
    t.integer  "camera_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frames", ["camera_id"], name: "index_frames_on_camera_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
