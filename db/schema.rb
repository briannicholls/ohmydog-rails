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

ActiveRecord::Schema[8.0].define(version: 2025_05_31_080903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
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
    t.string "zip_code"
    t.string "door_code"
    t.string "lockbox_code"
    t.string "entry_instructions"
    t.string "neighborhood"
    t.string "phone2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.string "breed"
    t.datetime "birthday", precision: nil
    t.string "temperament"
    t.string "notes"
    t.string "appearance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "fname"
    t.string "lname"
    t.string "password_digest"
    t.string "role", default: "employee"
    t.string "phone"
    t.string "status", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walks", force: :cascade do |t|
    t.datetime "window_start", precision: nil
    t.datetime "window_end", precision: nil
    t.integer "user_id"
    t.integer "pet_id"
    t.string "notes"
    t.string "walk_type"
    t.boolean "completed?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date", precision: nil
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
