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

ActiveRecord::Schema.define(version: 2020_02_26_201948) do

  create_table "pricing_dimensions", force: :cascade do |t|
    t.string "rate_code"
    t.string "description"
    t.string "begin_range"
    t.string "end_range"
    t.string "unit"
    t.string "price_per_unit"
    t.integer "pricing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pricing_id"], name: "index_pricing_dimensions_on_pricing_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.string "offer_term"
    t.datetime "effective_date"
    t.datetime "synced_date"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_pricings_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "location"
    t.string "location_type"
    t.integer "service_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_products_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "pricing_url"
    t.integer "vendor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_services_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
