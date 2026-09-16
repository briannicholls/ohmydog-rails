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

ActiveRecord::Schema[8.1].define(version: 2026_09_16_003000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "address"
    t.string "apartment_number"
    t.datetime "created_at", null: false
    t.string "door_code"
    t.string "email"
    t.string "entry_instructions"
    t.string "fname"
    t.string "lname"
    t.string "lockbox_code"
    t.string "neighborhood"
    t.string "phone"
    t.string "phone2"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "zip_code"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "appearance"
    t.datetime "birthday", precision: nil
    t.string "breed"
    t.datetime "created_at", null: false
    t.string "gender"
    t.string "name"
    t.string "notes"
    t.integer "owner_id"
    t.string "pet_type"
    t.string "temperament"
    t.datetime "updated_at", null: false
  end

  create_table "task_records", id: false, force: :cascade do |t|
    t.string "version", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.citext "email"
    t.string "encrypted_password", default: "", null: false
    t.string "fname"
    t.string "lname"
    t.string "password_digest"
    t.string "phone"
    t.string "provider"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "customer"
    t.string "status", default: "active"
    t.string "uid"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walks", force: :cascade do |t|
    t.boolean "completed?"
    t.datetime "created_at", null: false
    t.datetime "date", precision: nil
    t.string "notes"
    t.integer "pet_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "walk_type"
    t.datetime "window_end", precision: nil
    t.datetime "window_start", precision: nil
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "owners", "users"
end
