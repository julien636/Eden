# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_12_152404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "buyer_zipcode"
    t.string "buyer_adress"
    t.string "buyer_city"
    t.string "buyer_country"
    t.string "buyer_rating_number"
    t.string "buyer_rating"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "farmers", force: :cascade do |t|
    t.string "phone_number"
    t.integer "rating_number"
    t.float "rating"
    t.string "farmer_zipcode"
    t.string "farmer_adress"
    t.string "farmer_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "farmer_city"
    t.integer "count"
  end

  create_table "offers", force: :cascade do |t|
    t.float "offer_quantity"
    t.datetime "date_harvest"
    t.float "offer_price"
    t.string "offer_adress"
    t.string "offer_zipcode"
    t.string "offer_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.bigint "farmer_id"
    t.string "offer_city"
    t.index ["farmer_id"], name: "index_offers_on_farmer_id"
    t.index ["product_id"], name: "index_offers_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "prod_category"
    t.string "prod_name"
    t.string "prod_subname"
    t.float "prod_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transa_adress"
    t.string "transa_zipcode"
    t.float "transa_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_id"
    t.bigint "offer_id"
    t.datetime "transa_date"
    t.string "transa_city"
    t.boolean "transa_confirmation"
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["offer_id"], name: "index_transactions_on_offer_id"
  end

end
