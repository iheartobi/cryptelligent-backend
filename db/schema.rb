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

ActiveRecord::Schema.define(version: 2019_11_21_173101) do

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
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_coins_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "img_url", default: "http://brandesscadmusrealestate.com/images/team/blank.png"
    t.string "bg_url", default: "https://cdn.hipwallpaper.com/i/39/64/bzVo03.jpg"
    t.integer "coinbank", default: 1000
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
