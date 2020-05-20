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

ActiveRecord::Schema.define(version: 2020_05_20_221541) do

  create_table "bikes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "rental_date"
    t.datetime "return_date"
    t.integer "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["dealer_id"], name: "index_bikes_on_dealer_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "demo_reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bike_id", null: false
    t.string "location"
    t.string "report"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bike_id"], name: "index_demo_reports_on_bike_id"
    t.index ["user_id"], name: "index_demo_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bikes", "dealers"
  add_foreign_key "demo_reports", "bikes"
  add_foreign_key "demo_reports", "users"
end
