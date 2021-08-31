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

ActiveRecord::Schema.define(version: 2021_08_31_110610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "requester_id", null: false
    t.bigint "addressed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressed_id"], name: "index_friendships_on_addressed_id"
    t.index ["requester_id"], name: "index_friendships_on_requester_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "roadtrip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "order", default: 0
    t.float "distance"
    t.float "duration"
    t.index ["roadtrip_id"], name: "index_itineraries_on_roadtrip_id"
  end

  create_table "itinerary_steps", force: :cascade do |t|
    t.bigint "step_id", null: false
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["itinerary_id"], name: "index_itinerary_steps_on_itinerary_id"
    t.index ["step_id"], name: "index_itinerary_steps_on_step_id"
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
    t.integer "owner"
    t.string "start_date"
    t.string "end_date"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "order", default: 0
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
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
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "username", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "friendships", "users", column: "addressed_id"
  add_foreign_key "friendships", "users", column: "requester_id"
  add_foreign_key "itineraries", "roadtrips"
  add_foreign_key "itinerary_steps", "itineraries"
  add_foreign_key "itinerary_steps", "steps"
  add_foreign_key "messages", "roadtrips"
  add_foreign_key "messages", "users"
  add_foreign_key "partner_tasks", "partners"
  add_foreign_key "partner_tasks", "tasks"
  add_foreign_key "partners", "roadtrips"
  add_foreign_key "partners", "users"
  add_foreign_key "tasks", "roadtrips"
end
