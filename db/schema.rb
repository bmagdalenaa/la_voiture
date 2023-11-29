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

ActiveRecord::Schema[7.0].define(version: 2023_11_29_223227) do
  create_table "colors", force: :cascade do |t|
    t.string "color_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_lists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string "fuel_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "manufacturer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_colors", force: :cascade do |t|
    t.integer "color_id", null: false
    t.integer "model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_model_colors_on_color_id"
    t.index ["model_id"], name: "index_model_colors_on_model_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "model_name"
    t.integer "manufacturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_models_on_manufacturer_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "order_number"
    t.float "order_price"
    t.date "order_date"
    t.integer "quantity"
    t.float "gst"
    t.float "pst"
    t.float "harmonized_tax"
    t.integer "contact_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_list_id"], name: "index_order_details_on_contact_list_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_name"
    t.float "vehicle_price"
    t.string "vin_identification"
    t.integer "type_id", null: false
    t.integer "model_id", null: false
    t.integer "fuel_id", null: false
    t.integer "order_details_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fuel_id"], name: "index_vehicles_on_fuel_id"
    t.index ["model_id"], name: "index_vehicles_on_model_id"
    t.index ["order_details_id"], name: "index_vehicles_on_order_details_id"
    t.index ["type_id"], name: "index_vehicles_on_type_id"
  end

  add_foreign_key "model_colors", "colors"
  add_foreign_key "model_colors", "models"
  add_foreign_key "models", "manufacturers"
  add_foreign_key "order_details", "contact_lists"
  add_foreign_key "vehicles", "fuels"
  add_foreign_key "vehicles", "models"
  add_foreign_key "vehicles", "order_details", column: "order_details_id"
  add_foreign_key "vehicles", "types"
end
