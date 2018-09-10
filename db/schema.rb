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

ActiveRecord::Schema.define(version: 20180908195438) do

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.float "progress", default: 0.0
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.text "last_progresses", default: "---\n:2018-09-08 15:49:06 -0300: '0.0'\n"
    t.text "last_progresses_day"
    t.index ["profile_id"], name: "index_products_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profile_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
