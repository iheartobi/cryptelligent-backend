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

ActiveRecord::Schema.define(version: 2019_12_27_150827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.string "symbol"
    t.string "logo_url"
    t.bigint "price"
    t.integer "rank"
    t.datetime "price_date"
    t.bigint "market_cap"
    t.bigint "circulating_supply"
    t.bigint "max_supply"
    t.bigint "high"
    t.bigint "high_timestamp"
    t.integer "max_sold", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_transactions_on_coin_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "img_url", default: "http://brandesscadmusrealestate.com/images/team/blank.png"
    t.string "bg_url", default: "https://rumplenewskins.com/image/322341-full_witter-coin-home.jpg"
    t.bigint "coinbank", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
