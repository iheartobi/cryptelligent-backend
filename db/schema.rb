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

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "tier"
    t.integer "win_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "roster"
    t.integer "points", default: 0
    t.integer "rank"
    t.integer "wins"
    t.integer "loss"
    t.integer "tie"
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "img_url", default: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcxydKf3jQLULLej801Y4z9c5cL3uKX_j66GviTQLCH6py0qvc"
    t.string "bg_url", default: "https://i.ytimg.com/vi/Ia1tjllVygs/maxresdefault.jpg"
    t.integer "coinbank", default: 1000
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
