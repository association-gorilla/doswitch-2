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

ActiveRecord::Schema.define(version: 2020_05_18_095248) do

  create_table "achieve_rates", force: :cascade do |t|
    t.integer "user_id"
    t.integer "verb_id"
    t.float "date_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_plan_allots", force: :cascade do |t|
    t.integer "verb_id", null: false
    t.integer "user_id", null: false
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_real_allots", force: :cascade do |t|
    t.integer "verb_id", null: false
    t.integer "user_id", null: false
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plan_allot_id"
    t.integer "term_num"
    t.string "behavior", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_allots", force: :cascade do |t|
    t.integer "verb_id", null: false
    t.integer "allot"
    t.datetime "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_allots", force: :cascade do |t|
    t.integer "verb_id", null: false
    t.integer "allot"
    t.datetime "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.integer "plan_allot_id"
    t.string "profit"
    t.string "penalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.text "image_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "deleted_at IS NULL"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verbs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.boolean "selected", default: false, null: false
    t.boolean "important", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
