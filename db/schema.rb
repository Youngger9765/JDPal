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

ActiveRecord::Schema.define(version: 20160909121831) do

  create_table "interestings", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "interestings", ["interest_id"], name: "index_interestings_on_interest_id", using: :btree
  add_index "interestings", ["user_id"], name: "index_interestings_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "interests", ["name"], name: "index_interests_on_name", unique: true, using: :btree

  create_table "language_levels", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "chinese_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "chinese_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true, using: :btree

  create_table "order_interestings", force: :cascade do |t|
    t.integer  "order_id",    limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "order_interestings", ["interest_id"], name: "index_order_interestings_on_interest_id", using: :btree
  add_index "order_interestings", ["order_id"], name: "index_order_interestings_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "tour_guide_id",     limit: 4
    t.boolean  "finished"
    t.string   "status",            limit: 255
    t.date     "user_prefer_date"
    t.date     "final_date"
    t.string   "user_prefer_place", limit: 255
    t.string   "final_place",       limit: 255
    t.text     "note",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.string   "phone_number",      limit: 255
    t.string   "country",           limit: 255
    t.string   "language",          limit: 255
    t.integer  "people_count",      limit: 4
    t.integer  "request_days",      limit: 4
    t.string   "purpose",           limit: 255
    t.text     "others",            limit: 65535
    t.date     "birthday"
    t.string   "gender",            limit: 255
    t.string   "social_media_id",   limit: 255
    t.integer  "group_id",          limit: 4
  end

  add_index "orders", ["birthday"], name: "index_orders_on_birthday", using: :btree
  add_index "orders", ["gender"], name: "index_orders_on_gender", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "user_language_ships", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.string   "level",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "user_language_ships", ["language_id"], name: "index_user_language_ships_on_language_id", using: :btree
  add_index "user_language_ships", ["user_id"], name: "index_user_language_ships_on_user_id", using: :btree

  create_table "user_role_ships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_role_ships", ["role_id"], name: "index_user_role_ships_on_role_id", using: :btree
  add_index "user_role_ships", ["user_id"], name: "index_user_role_ships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "fb_uid",                 limit: 255
    t.string   "fb_token",               limit: 255
    t.string   "name",                   limit: 255
    t.string   "nick_name",              limit: 255
    t.string   "facebook_url",           limit: 255
    t.string   "head_shot",              limit: 255
    t.text     "description_English",    limit: 65535
    t.text     "description_Chinese",    limit: 65535
    t.string   "profession",             limit: 255
    t.string   "availability",           limit: 255
    t.string   "travel_footprints",      limit: 255
    t.string   "familiar_areas",         limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "country",                limit: 255
    t.date     "birthday"
    t.string   "gender",                 limit: 255
    t.string   "social_media_id",        limit: 255
  end

  add_index "users", ["birthday"], name: "index_users_on_birthday", using: :btree
  add_index "users", ["country"], name: "index_users_on_country", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
  add_index "users", ["gender"], name: "index_users_on_gender", using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
