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

ActiveRecord::Schema.define(version: 2020_03_15_224730) do

  create_table "owners", force: :cascade do |t|
    t.string "address"
    t.string "apartment_number"
    t.integer "zip_code"
    t.string "door_code"
    t.string "lockbox_code"
    t.string "entry_instructions"
    t.string "neighborhood"
    t.string "phone2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.string "breed"
    t.datetime "birthday"
    t.string "temperament"
    t.string "notes"
    t.string "appearance"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "fname"
    t.string "lname"
    t.string "password_digest"
    t.string "role", default: "customer"
    t.string "phone"
    t.string "status", default: "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "walks", force: :cascade do |t|
    t.datetime "window_start"
    t.datetime "window_end"
    t.integer "user_id"
    t.integer "pet_id"
    t.string "notes"
    t.string "walk_type"
    t.boolean "completed?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
