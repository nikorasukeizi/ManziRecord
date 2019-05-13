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

ActiveRecord::Schema.define(version: 2019_05_13_073955) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "rubi_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_infos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "payments"
    t.string "addressee"
    t.string "delivery_postcode"
    t.text "delivery_address"
    t.integer "buy_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_items", force: :cascade do |t|
    t.integer "buy_info_id"
    t.integer "item_id"
    t.integer "buy_count"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.integer "buy_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "item_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "label_id"
    t.integer "genre_id"
    t.string "name"
    t.string "image_id"
    t.integer "price"
    t.integer "stock"
    t.integer "status"
    t.integer "sales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "rubi_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "rubi_first_name"
    t.string "rubi_last_name"
    t.string "postcord"
    t.text "address"
    t.string "tel"
    t.string "email"
    t.string "password"
    t.date "birthdate"
    t.boolean "status"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
