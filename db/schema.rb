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

ActiveRecord::Schema[8.1].define(version: 2020_03_17_234650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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
    t.integer "zip_code"
  end

  create_table "pets", force: :cascade do |t|
    t.string "appearance"
    t.datetime "birthday", precision: nil
    t.string "breed"
    t.datetime "created_at", null: false
    t.string "gender"
    t.string "image"
    t.string "name"
    t.string "notes"
    t.integer "owner_id"
    t.string "temperament"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "fname"
    t.string "lname"
    t.string "password_digest"
    t.string "phone"
    t.string "role", default: "customer"
    t.string "status", default: "active"
    t.datetime "updated_at", null: false
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
end
