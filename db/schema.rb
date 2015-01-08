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

ActiveRecord::Schema.define(version: 20150108064236) do

  create_table "customer_questions", force: true do |t|
    t.string   "title"
    t.string   "answer"
    t.string   "note"
    t.integer  "work_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_questions", ["work_order_id"], name: "index_customer_questions_on_work_order_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "phone_num",         null: false
    t.string   "disability_degree"
    t.string   "education"
    t.string   "occupation"
    t.boolean  "marital_status"
    t.string   "address"
    t.string   "address_type"
    t.string   "channel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_records", force: true do |t|
    t.string   "phone_num",     null: false
    t.integer  "duration"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_order_id"
  end

  add_index "phone_records", ["work_order_id"], name: "index_phone_records_on_work_order_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_orders", force: true do |t|
    t.string   "status",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "users_id"
  end

  add_index "work_orders", ["customer_id"], name: "index_work_orders_on_customer_id", using: :btree
  add_index "work_orders", ["users_id"], name: "index_work_orders_on_users_id", using: :btree

end
