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

ActiveRecord::Schema.define(version: 20150922174835) do

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state",           limit: 2
    t.string   "zip"
    t.integer  "organization_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "addresses", ["organization_id"], name: "index_addresses_on_organization_id"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["address_id"], name: "index_areas_on_address_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.boolean  "admin",               default: false, null: false
    t.string   "email",               default: "",    null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

end
