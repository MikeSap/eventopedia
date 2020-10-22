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

ActiveRecord::Schema.define(version: 2020_10_19_164322) do

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer"
    t.integer "quantity"
    t.string "category"
    t.string "sub_category"
    t.integer "vendor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment_bookings", force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "show_id"
    t.integer "quantity", default: 1
    t.integer "quantity_checked_out", default: 0
    t.integer "quantity_checked_in", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permission_classes", force: :cascade do |t|
    t.boolean "create_users"
    t.boolean "create_equipment"
    t.boolean "create_show"
    t.boolean "book_technician"
    t.boolean "book_equipment"
    t.boolean "bookable"
    t.boolean "admin"
    t.integer "vendor_id"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.string "venue"
    t.string "client"
    t.datetime "start"
    t.datetime "end"
    t.integer "vendor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technician_bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
    t.datetime "call_time"
    t.datetime "out_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.integer "permission_class_id"
    t.integer "vendor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "url"
    t.string "phone_number"
    t.string "contact_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
