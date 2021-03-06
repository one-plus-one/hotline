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

ActiveRecord::Schema.define(version: 20150128015736) do

  create_table "catalogs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "phone_num",         null: false
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

  create_table "repositories", force: true do |t|
    t.string   "title"
    t.text     "answer"
    t.integer  "catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repository_logs", force: true do |t|
    t.string   "name"
    t.string   "action"
    t.text     "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "work_orders", force: true do |t|
    t.string   "status",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "phone_record_id"
    t.integer  "updated_user_id"
  end

  add_index "work_orders", ["updated_user_id"], name: "index_work_orders_on_updated_user_id", using: :btree

end
