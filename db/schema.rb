# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_22_062131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buddies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "line_id", null: false
    t.string "name"
    t.string "buddy_image"
    t.index ["line_id"], name: "index_buddies_on_line_id", unique: true
  end

  create_table "buddy_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "buddy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buddy_id"], name: "index_buddy_users_on_buddy_id"
    t.index ["user_id", "buddy_id"], name: "index_buddy_users_on_user_id_and_buddy_id", unique: true
    t.index ["user_id"], name: "index_buddy_users_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.integer "category", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  create_table "per_day_smokings", force: :cascade do |t|
    t.integer "number_of_smoking"
    t.date "smoked_on"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["smoked_on", "user_id"], name: "index_per_day_smokings_on_smoked_on_and_user_id", unique: true
    t.index ["user_id"], name: "index_per_day_smokings_on_user_id"
  end

  create_table "smokings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_smokings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.integer "excess_cigarette", default: 0, null: false
    t.integer "target_number", null: false
    t.integer "state", default: 0, null: false
    t.integer "life", default: 1, null: false
    t.integer "role", default: 0, null: false
    t.string "invite_code", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invite_code"], name: "index_users_on_invite_code", unique: true
  end

  add_foreign_key "buddy_users", "buddies"
  add_foreign_key "buddy_users", "users"
  add_foreign_key "per_day_smokings", "users"
  add_foreign_key "smokings", "users"
end
