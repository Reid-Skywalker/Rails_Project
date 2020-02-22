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

ActiveRecord::Schema.define(version: 2020_02_22_003607) do

  create_table "campaign_monsters", force: :cascade do |t|
    t.integer "monster_id", null: false
    t.integer "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_campaign_monsters_on_campaign_id"
    t.index ["monster_id"], name: "index_campaign_monsters_on_monster_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "Name"
    t.date "Start_Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "character_class"
    t.string "race"
    t.integer "level"
    t.integer "health"
    t.integer "damage"
    t.integer "player_id", null: false
    t.integer "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "health"
    t.integer "damage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "registration_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campaign_monsters", "campaigns"
  add_foreign_key "campaign_monsters", "monsters"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "players"
end
