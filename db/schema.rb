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

ActiveRecord::Schema.define(version: 20140904120106) do

  create_table "order_items", force: true do |t|
    t.integer  "order_id",      null: false
    t.integer  "product_id",    null: false
    t.integer  "product_count", null: false
    t.integer  "product_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.integer  "cash_from"
    t.text     "comment"
    t.integer  "order_status_id", default: 0
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "summ_price"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.integer  "price",         default: 100
    t.integer  "price_classic", default: 250
    t.integer  "price_big",     default: 350
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_order", default: 1000
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "statics", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "short_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.integer  "role",                   default: 1
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
