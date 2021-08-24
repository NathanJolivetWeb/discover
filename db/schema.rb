# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_24_155735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "requester_id", null: false
    t.bigint "addressed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressed_id"], name: "index_friendships_on_addressed_id"
    t.index ["requester_id"], name: "index_friendships_on_requester_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "address_start"
    t.string "address_end"
    t.bigint "roadtrip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadtrip_id"], name: "index_itineraries_on_roadtrip_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "roadtrip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadtrip_id"], name: "index_messages_on_roadtrip_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "partner_tasks", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_partner_tasks_on_partner_id"
    t.index ["task_id"], name: "index_partner_tasks_on_task_id"
  end

  create_table "partners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "roadtrip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadtrip_id"], name: "index_partners_on_roadtrip_id"
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "roadtrips", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "En cours"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "content"
    t.bigint "roadtrip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadtrip_id"], name: "index_tasks_on_roadtrip_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users", column: "addressed_id"
  add_foreign_key "friendships", "users", column: "requester_id"
  add_foreign_key "itineraries", "roadtrips"
  add_foreign_key "messages", "roadtrips"
  add_foreign_key "messages", "users"
  add_foreign_key "partner_tasks", "partners"
  add_foreign_key "partner_tasks", "tasks"
  add_foreign_key "partners", "roadtrips"
  add_foreign_key "partners", "users"
  add_foreign_key "tasks", "roadtrips"
end
