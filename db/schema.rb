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

ActiveRecord::Schema.define(version: 20160821071756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "payment_type_id", limit: 2
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "group"
    t.string   "username",                                       null: false
    t.string   "tel",                 limit: 20
    t.string   "email",                                          null: false
    t.text     "purpose",                                        null: false
    t.integer  "payment_method_id",   limit: 2,                  null: false
    t.text     "remarks",                                        null: false
    t.date     "utilization_date",                               null: false
    t.integer  "utilization_time_id", limit: 2,                  null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "disabled",                       default: false
  end

  add_index "reservations", ["utilization_date"], name: "index_reservations_on_utilization_date", using: :btree
  add_index "reservations", ["utilization_time_id"], name: "index_reservations_on_utilization_time_id", using: :btree

  create_table "reservations_equipments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "equipment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "utilization_times", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "price",         null: false
    t.integer  "holiday_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
